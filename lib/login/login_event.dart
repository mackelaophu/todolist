import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:ff_bloc/ff_bloc.dart';

import 'package:to_do_list/login/index.dart';

@immutable
abstract class LoginEvent implements FFBlocEvent<LoginState, LoginBloc> {}

class LoadLoginEvent extends LoginEvent {
  LoadLoginEvent({required this.id});
  final String? id;
  
  static const String _name = 'LoadLoginEvent';

  @override
  String toString() => _name;

  @override
  Stream<LoginState> applyAsync({required LoginBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    final result = await bloc.provider.fetchAsync(id);
    yield bloc.state.copyWithoutError(
      isLoading: false,
      data: LoginViewModel(items: result),
    );
  }
}


class AddLoginEvent extends LoginEvent {
  static const String _name = 'AddLoginEvent';

  @override
  String toString() => _name;

  @override
  Stream<LoginState> applyAsync({required LoginBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    final result = await bloc.provider.addMore(bloc.state.data?.items);
    yield bloc.state.copyWithoutError(
      isLoading: false,
      data: LoginViewModel(items: result),
    );
  }
}

class ErrorLoginEvent extends LoginEvent {
  static const String _name = 'ErrorYouAwesomeEvent';

  @override
  String toString() => _name;

  @override
  Stream<LoginState> applyAsync({required LoginBloc bloc}) async* {
    throw Exception('Test error');
  }
}

class ClearLoginEvent extends LoginEvent {
  static const String _name = 'ClearLoginEvent';

  @override
  String toString() => _name;

  @override
  Stream<LoginState> applyAsync({required LoginBloc bloc}) async* {
    yield bloc.state.copyWithoutError(isLoading: true);
    yield bloc.state.copyWithoutData(
      isLoading: false,
    );
  }
}
