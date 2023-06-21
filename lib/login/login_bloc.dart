import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/login/login_event.dart';
import 'package:to_do_list/login/login_model.dart';
import 'package:to_do_list/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginModel _loginModel;
  StreamSubscription? _streamSubscription;
  LoginBloc({required LoginModel loginModel})
      : _loginModel = loginModel,
        super(LoginInittialState()) {
    on<LoginActionEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginActionEvent event, Emitter<LoginState> emit) async {
    _streamSubscription?.cancel;
    emit(const LoginLoadingState());
    try {
      var data = await _loginModel.login("username", "password");
      if (data != null) {
        emit(LoginDismissLoadingState(data: data));
      }
    } on Exception catch (e) {
      emit(LoginErrorState(error: e));
    }
  }
}
