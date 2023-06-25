import 'package:to_do_list/login/login_response.dart';

enum DragEvent { doing, done }

class HomeModel {
  final List<ToDoEntity> desk;
  final List<ToDoEntity> doingDesk;
  final List<ToDoEntity> doneDesk;

  const HomeModel(
      {required this.desk, required this.doingDesk, required this.doneDesk});

  void removeItemAt(int id, DragEvent event) {
    final item = desk[id];
    if (event == DragEvent.doing) {
      doingDesk.add(item);
    } else {
      doneDesk.add(item);
    }
    desk.remove(item);
  }
}
