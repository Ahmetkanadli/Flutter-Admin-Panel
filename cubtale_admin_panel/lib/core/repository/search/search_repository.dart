import 'dart:convert';
import 'dart:io';

import 'package:cubtale_admin_panel/core/failure/login/login_repository_failure.dart';
import 'package:cubtale_admin_panel/core/model/search_model.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_bloc.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_events.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Search {
  
  // Kullanıcı verilerini dahli depolamada tutmak için
  final _userInformation = Hive.box<Map<String, dynamic>>("user_information");

  @override
  Future<List<SearchUsers>?> userSearch({
    required String userInfo,
    required String searchType,
    required BuildContext context}) async {
    try {
      const url = "https://4t3mnxl8p8.execute-api.us-east-2.amazonaws.com/default/AdminPanelSearch";
      final jsonData = {
        searchType: userInfo,
      };

      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(jsonData),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      //final result = decodeResponseBody(response.bodyBytes);
      final result = SearchUser.fromJson(jsonDecode(response.body));
      final generalFailure = _handleGeneralErrors(response.statusCode, result.toJson());

      if (generalFailure != null){
        left(generalFailure);
        return null;
      }
      else if(result.toString() == "{users: []}"){
        const LoginRepositoryNotFoundFailure();
        return null;
      }
      else {
        context.read<SearchBloc>().add(ResultEvent(result.users!));
        context.read<SearchBloc>().add(ResultEvent(result.users!));

        return result.users;
      }
    } on SocketException catch (_) {
      print(_.message);
      const LoginRepositoryConnectionFailure();
      return null;
    } catch (e) {
      LoginRepositoryUnknownFailure(e.toString());
      return null;
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
