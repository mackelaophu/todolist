import 'package:flutter/material.dart';
import 'package:to_do_list/home/to_do_list_card.dart';
import 'package:to_do_list/login/login_response.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.loginEntity, super.key});
  final LoginEntity loginEntity;
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
              ToDoCard(
                entity: widget.loginEntity.data[3],
              ),
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
            size: 50,
          ),
        ),
      ),
    );
  }
}
