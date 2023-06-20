import 'package:ff_bloc/ff_bloc.dart';

import 'package:to_do_list/login/index.dart';

class LoginBloc extends FFBloc<LoginEvent, LoginState> {
  LoginBloc({    
    required this.provider,
    super.initialState = const LoginState(),
  });

  final LoginProvider provider;

  @override
  LoginState onErrorState(Object error) => state.copy(error: error, isLoading: false);

}
