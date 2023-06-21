import 'package:equatable/equatable.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

final class LoginActionEvent extends LoginEvent {
  const LoginActionEvent();
}