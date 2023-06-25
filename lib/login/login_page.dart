import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/home_bloc.dart';
import 'package:to_do_list/home/home_model.dart';
import 'package:to_do_list/home/home_page.dart';
import 'package:to_do_list/home/home_state.dart';
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
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginDismissLoadingState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => HomeBloc(
                          model: HomeModel(
                              desk: state.data.data
                                  .where((element) => element.status == "todo")
                                  .toList(),
                              doingDesk: state.data.data
                                  .where((element) => element.status == "doing")
                                  .toList(),
                              doneDesk: state.data.data
                                  .where((element) => element.status == "done")
                                  .toList())),
                      child: HomePage(),
                    ),
                fullscreenDialog: true));
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Stack(
              children: [
                const FirstTimeLogin(),
                if (state is LoginLoadingState) ...{
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                } else if (state is LoginErrorState) ...{
                  Center(
                    child: Text("error: ${state.error.toString()}"),
                  )
                },
              ],
            );
          },
        ),
      ),
    );
  }
}
