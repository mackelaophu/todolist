import 'package:equatable/equatable.dart';
import 'package:to_do_list/login/login_response.dart';

sealed class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

final class LoginInittialState extends LoginState {
}
final class LoginErrorState extends LoginState {
  final Exception error;
  const LoginErrorState({required this.error});
}

final class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

final class LoginDismissLoadingState extends LoginState {
  final LoginEntity data;
  const LoginDismissLoadingState({required this.data});
}