import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/home/card_desk_widget.dart';
import 'package:to_do_list/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: null,
          leadingWidth: 0,
          automaticallyImplyLeading: false,
          title: const Text(
            "TODER LIST",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: const [
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
            )
          ]),
      body: Stack(
        children: [
          Row(
            children: [
              const Spacer(),
              DeskCardWidget(desk: context.read<HomeBloc>().model.desk),
              const Spacer()
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_bitcoin),
            label: "Doing",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "To Do",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Done",
          ),
        ],
      ),
      floatingActionButton: const InkWell(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: Icon(
            Icons.add_circle_rounded,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
