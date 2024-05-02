


import 'package:cubtale_admin_panel/core/model/search_model.dart';

abstract class SearchEvent{
  const SearchEvent();
}

class EmailEvent extends SearchEvent{
  final String email;
  const EmailEvent(this.email);
}

class ResultEvent extends SearchEvent{
  final List<SearchUsers>? result;
  const ResultEvent(this.result);
}