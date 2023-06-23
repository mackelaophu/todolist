
class LoginEntity {
  final String status;
  final List<ToDoEntity> data;
  const LoginEntity({required this.status, required this.data});
}

class ToDoEntity {
  final String id;
  final String task;
  final String des;
  final String status;
  const ToDoEntity({
    required this.id,required this.task,required this.des,required this.status
  });
}
