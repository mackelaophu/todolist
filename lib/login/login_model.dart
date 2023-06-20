// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  const LoginModel({
    required this.name,
  });
  final String name;

  @override
  List<Object> get props => [ name];

  Map<dynamic, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  static LoginModel? fromMap(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return LoginModel(
      name: map['name']!.toString(),
    );
  }

}

class LoginViewModel extends Equatable {
  const LoginViewModel({
    // TODO(all): add all required constructor parameters
    required this.items,
  });

  // TODO(all): declare your fields here
  final List<LoginModel>? items;

  @override
  List<Object?> get props => [items /*TODO(all): List all fields here*/];

  // TODO(all): implement copyWith
  LoginViewModel copyWith({
    List<LoginModel>? items,
  }) {
    return  LoginViewModel(
        items: items ?? this.items,
      );
  }
}
