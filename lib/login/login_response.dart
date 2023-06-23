// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginEntity {
  final String status;
  final List<ToDoEntity> data;
  LoginEntity({required this.status, required this.data});

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
      status: json['status'], data: (json['data'] as List).cast<ToDoEntity>());

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': status, 'data': data};
}

@JsonSerializable()
class ToDoEntity {
  final String id;
  final String task;
  final String des;
  final String status;
  ToDoEntity(
      {required this.id,
      required this.task,
      required this.des,
      required this.status});

  factory ToDoEntity.fromJson(Map<String, dynamic> json) => ToDoEntity(
      id: json['id'] as String,
      task: json['task'] as String,
      des: json['task'] as String,
      status: json['status'] as String);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'task': task, 'des': des, 'status': status};
}
