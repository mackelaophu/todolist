import 'dart:async';

import 'package:dio/dio.dart';

class LoginModel {
  final dio = Dio();
  Future<String?> login(String username, String password) async {
    try {
      // 404
      await dio.get('https://dart.dev');
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
