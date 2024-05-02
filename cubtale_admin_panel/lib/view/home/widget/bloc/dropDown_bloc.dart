






import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_events.dart';
import 'package:cubtale_admin_panel/view/home/widget/bloc/dropDown_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState>{
  DropDownBloc() : super( DropDownState()){

    on<IsPressedEvent>(_dropDownState);
  }

  void _dropDownState(IsPressedEvent event, Emitter<DropDownState> emit){
    print(state.isPressed);
    emit(state.copyWith(isPressed: event.isPressed));
  }
}