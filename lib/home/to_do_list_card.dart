import 'package:flutter/material.dart';
import 'package:to_do_list/login/login_response.dart';

class ToDoCard extends StatelessWidget {
  final ToDoEntity entity;
  const ToDoCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 580,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.red,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8)
          ]),
      child: Stack(children: [
        Positioned.fill(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            entity.image,
            fit: BoxFit.cover,
          ),
        )),
        Positioned(
          bottom: 0,
          child: Container(
            height: 200,
            width: 340,
            decoration: ShapeDecoration(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                gradient: LinearGradient(
                    colors: [Colors.black87, Colors.black12.withOpacity(0.02)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Stack(children: [
              Positioned(
                bottom: 40,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entity.task,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      entity.des,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              const Positioned(
                bottom: 40,
                right: 20,
                child: Icon(
                  Icons.info,
                  size: 35,
                  color: Colors.white,
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
