import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:to_do_list/login/login_response.dart';

class LoginModel {
  final dio = Dio();
  Future<dynamic?> login(String username, String password) async {
    try {
      // 404
      var response =  await dio.post('http://127.0.0.1:3001/login',data:{"username":username,"password":password});
      var entity = LoginEntity.fromJson(response.data);
      return entity;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        return e.message;
      } else {
        return "error on null";
      }
    }
  }
}
