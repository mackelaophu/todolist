
import 'dart:async';
import 'package:to_do_list/login/index.dart';

class LoginProvider {

  Future<List<LoginModel>?> fetchAsync(String? id) async {
    if (id == null) {
      return null;
    }
    return [LoginModel(name: id)];
  }


  Future<List<LoginModel>?> addMore(List<LoginModel>? now) async {
    final result = [
      ...(now ?? <LoginModel>[]),
      LoginModel(name: now?.length.toString() ?? '0')
    ];
    return result;
  }

}

