import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/login/index.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({
    required this.bloc,
    super.key,
  }) ;

  @protected
  final LoginBloc bloc;

  @override
  State<LoginScreen> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
    if (!widget.bloc.state.hasData) {
      _load();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: BlocBuilder<LoginBloc, LoginState>(
      bloc: widget.bloc,
      builder: (
        BuildContext context,
        LoginState currentState,
      ) {
        return currentState.when(
          onLoading: ()=>const CircularProgressIndicator(),
          onEmpty: (data) =>  _Empty(),
          onData: (data) =>  _BodyList(data: data),
          onError: (e) =>  Center(
            child: Column(
              children: [
                Text(e.toString()),
                TextButton(
                  onPressed: _load,
                  child: const Text('ReLoad'),
                )
              ],
            ),
          ),
        );
      },
    ),);
  }

  void _load() {
    widget.bloc.add(LoadLoginEvent(id:'1'));
  }

}


class _BodyList extends StatefulWidget {
  const _BodyList({required this.data});

  final LoginViewModel data;

  @override
  State<_BodyList> createState() => _BodyListState();
}

class _BodyListState extends State<_BodyList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
        // primary: true,
        slivers: [
          const SliverToBoxAdapter(child: Divider()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
          final item = widget.data.items![index];
          if (index == 0) {
            return Text('Header $index, id = '+item.name);
          }
          return Text('Index = $index, id = '+item.name);
        },
        childCount: widget.data.items!.length,
    ))]);
  }
}


class _Empty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Empty'),
      ],
    );
  }
}