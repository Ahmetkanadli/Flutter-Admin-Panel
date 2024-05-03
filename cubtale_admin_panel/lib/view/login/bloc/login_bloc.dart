
import 'package:cubtale_admin_panel/view/login/bloc/login_events.dart';
import 'package:cubtale_admin_panel/view/login/bloc/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(const LoginState()){

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit){
    emit(state.copyWith(password: event.password));
  }

}