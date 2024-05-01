import 'package:cubtale_admin_panel/core/model/auth%20model.dart';

class SearchState{
  final String email;
  final List<Users>? result ;

  SearchState({this.email = '', List<Users>? result}) : result = result ?? [];

  SearchState copyWith({String? email, List<Users>? result}){
    return SearchState(
      email: email??this.email,
      result: result ?? this.result
    );
  }
}