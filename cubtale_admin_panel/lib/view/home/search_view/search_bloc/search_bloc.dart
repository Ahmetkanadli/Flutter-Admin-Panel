




import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_events.dart';
import 'package:cubtale_admin_panel/view/home/search_view/search_bloc/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchBloc extends Bloc<SearchEvent, SearchState>{
  SearchBloc() : super(SearchState()){

    on<EmailEvent>(_emailEvent);

    on<ResultEvent>(_resultEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SearchState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _resultEvent(ResultEvent event, Emitter<SearchState> emit){
    emit(state.copyWith(result: event.result));
  }

}