import 'package:cubtale_admin_panel/core/model/search_model.dart';

class SearchState {
  final String email;
  final List<SearchUsers>? result;

  SearchState({this.email = '', List<SearchUsers>? result})
      : result = result ?? [];

  SearchState copyWith({String? email, List<SearchUsers>? result}) {
    return SearchState(
        email: email ?? this.email, result: result ?? this.result);
  }
}
