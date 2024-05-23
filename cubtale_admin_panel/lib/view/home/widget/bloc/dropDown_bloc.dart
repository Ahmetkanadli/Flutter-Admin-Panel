






import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_events.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState>{
  DropDownBloc() : super( DropDownState()){

    on<IsPressedEvent>(_dropDownState);
    on<SearchTitleEvent>(_searchTitleEvent);
    on<SearchTypeEvent>(_searchTypeEvent);

  }

  void _dropDownState(IsPressedEvent event, Emitter<DropDownState> emit){
    print(state.isPressed);
    emit(state.copyWith(isPressed: event.isPressed));
  }

  void _searchTitleEvent(SearchTitleEvent event, Emitter<DropDownState> emit){
    print(state.searchTitle);
    emit(state.copyWith(searchTitle: event.searchTitle));
  }

  void _searchTypeEvent(SearchTypeEvent event, Emitter<DropDownState> emit){
    print(state.searchType);
    emit(state.copyWith(searchTitle: event.searchType));
  }
}