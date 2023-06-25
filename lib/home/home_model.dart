import 'dart:developer';

import 'package:to_do_list/login/login_response.dart';

enum DragEvent { doing, done }

class HomeModel {
  final List<ToDoEntity> desk;
  final List<ToDoEntity> doingDesk;
  final List<ToDoEntity> doneDesk;

  const HomeModel(
      {required this.desk, required this.doingDesk, required this.doneDesk});

  void addItem(ToDoEntity item) {
    desk.add(item);
  }

  void removeItemAt(int id, DragEvent event) {
    final item = desk[id];
    if (event == DragEvent.doing) {
      log("=>>>>>doing");
      doingDesk.add(item);
    } else {
      log("=>>>>>done");
      doneDesk.add(item);
    }
    desk.remove(item);

    log("=>>>>>remove");
  }
}
