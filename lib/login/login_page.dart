import 'package:flutter/material.dart';
import 'package:to_do_list/login/index.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.bloc,
    super.key
    });
    
  final LoginBloc bloc;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginScreen(bloc: widget.bloc),
    );
  }
}
