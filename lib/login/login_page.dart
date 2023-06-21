import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/login/login_bloc.dart';
import 'package:to_do_list/login/login_event.dart';

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
              LoginInittialState() => Center(
                  child: TextButton(
                
                    onPressed: ()=> context.read<LoginBloc>().add(const LoginActionEvent()),
                    child: const Text('TextButton'),
                  ),
                ),
              LoginLoadingState() => const CircularProgressIndicator(),
              LoginDismissLoadingState() => Center(child: Text(state.data),),
              LoginErrorState() => Center(child: Text("error: ${state.error.toString()}"),)
            },
          );
        },
      ),
    );
  }
}
