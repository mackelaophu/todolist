import 'package:flutter/material.dart';
import 'package:to_do_list/login/index.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.bloc,
    super.key
    });
  static const String routeName = '/login';
  
  final LoginBloc bloc;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
         actions: [
          IconButton(
            icon: const Icon(Icons.error),
            onPressed: () {
              widget.bloc.add(ErrorLoginEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              widget.bloc.add(AddLoginEvent());
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              widget.bloc.add(ClearLoginEvent());
            },
          ),
        ],
      ),
      body: LoginScreen(bloc: widget.bloc),
    );
  }
}
