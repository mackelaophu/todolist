import 'package:ff_bloc/ff_bloc.dart';

import 'package:to_do_list/login/index.dart';

class LoginState extends FFState<LoginState, LoginViewModel> {
  const LoginState({
    super.version = 0,
    super.isLoading = false,
    super.data,
    super.error,
  });

  @override
  StateCopyFactory<LoginState, LoginViewModel> getCopyFactory() => LoginState.new;
}
