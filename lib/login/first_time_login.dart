import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/login/login_bloc.dart';
import 'package:to_do_list/login/login_event.dart';

class FirstTimeLogin extends StatefulWidget {
  const FirstTimeLogin({super.key});

  @override
  State<FirstTimeLogin> createState() => _FirstTimeLoginState();
}

class _FirstTimeLoginState extends State<FirstTimeLogin> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Spacer(),
              SizedBox(
                  height: 150,
                  child: Image.asset("assets/images/logonote.png")),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: 'Enter your username',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              _LoginButton(formKey: _formKey),
              const Spacer()
            ],
          )),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Validate will return true if the form is valid, or false if
            // the form is invalid.
            if (_formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(const LoginActionEvent());
            }
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
