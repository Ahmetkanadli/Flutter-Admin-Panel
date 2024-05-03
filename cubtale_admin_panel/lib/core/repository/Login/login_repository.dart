import 'dart:convert';
import 'dart:io';

import 'package:cubtale_admin_panel/core/failure/login/login_repository_failure.dart';
import 'package:cubtale_admin_panel/core/repository/Login/i_login_repository.dart';
import 'package:cubtale_admin_panel/core/service/decode_response_body.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class LoginRepository implements ISearchRepository {
  
  // Kullanıcı verilerini dahli depolamada tutmak için
  final _userInformation = Hive.box<Map<String,dynamic>>("user_information");

  @override
  Future<Either<LoginRepositoryFailure, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      const url = "https://p7y0pin0cl.execute-api.us-east-2.amazonaws.com/default/AdminPanelLogin";
      final jsonData = {
        "username": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(jsonData),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      final result = decodeResponseBody(response.bodyBytes);
      final generalFailure = _handleGeneralErrors(response.statusCode, result);

      if (generalFailure != null) return left(generalFailure);
      if(result.toString() == "{error_msg: Token verification failed, error_code: 1099}"){
        return left(const LoginRepositoryNotFoundFailure());
      }
      else {
        _userInformation.put(0, result);

        return right(true);
      }
    } on SocketException catch (_) {
      print(_.message);
      return left(const LoginRepositoryConnectionFailure());
    } catch (e) {
      return left(LoginRepositoryUnknownFailure(e.toString()));
    }
  }

  LoginRepositoryFailure? _handleGeneralErrors(
      int statusCode, Map<String, dynamic> result) {
    if (statusCode == 200) return null;

    final errorMap = result[0]['error'] as Map<String, dynamic>?;

    final message = errorMap?['message'] as String?;
    if (statusCode == 404) {
      return const LoginRepositoryNotFoundFailure();
    } else if (statusCode == 500) {
      return const LoginRepositoryInternalFailure();
    } else {
      return LoginRepositoryUnknownFailure(message);
    }
  }
}
