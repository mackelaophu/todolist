// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginEntity {
  final String status;
  final List<ToDoEntity> data;
  LoginEntity({required this.status, required this.data});

  factory LoginEntity.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>;
    var temp = <ToDoEntity>[];

    for (final element in list) {
      final item = ToDoEntity.fromJson(element);
      temp.add(item);
    }

    var entity = LoginEntity(status: json['status'], data: temp);
    return entity;
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': status, 'data': data};
}

@JsonSerializable()
class ToDoEntity {
  final String id;
  final String task;
  final String des;
  final String status;
  final String image;
  ToDoEntity(
      {required this.id,
      required this.task,
      required this.des,
      required this.status,
      required this.image});

  factory ToDoEntity.fromJson(Map<String, dynamic> json) => ToDoEntity(
      id: json['id'] as String,
      task: json['task'] as String,
      des: json['task'] as String,
      status: json['status'] as String,
      image: json['image']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'task': task,
        'des': des,
        'status': status,
        'image': image
      };
}
