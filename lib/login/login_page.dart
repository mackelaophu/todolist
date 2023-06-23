import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/login/first_time_login.dart';
import 'package:to_do_list/login/login_bloc.dart';

import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Center(
            child: switch (state) {
              LoginInittialState() => const Center(
                  child: FirstTimeLogin(),
                ),
              LoginLoadingState() => const CircularProgressIndicator(),
              LoginDismissLoadingState() => Center(child: Text(state.data.status),),
              LoginErrorState() => Center(child: Text("error: ${state.error.toString()}"),)
            },
          );
        },
      ),
    );
  }
}
