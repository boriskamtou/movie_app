import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  final id;
  final email;
  final password;

  User({
    this.id,
    this.email,
    this.password,
  });

  factory User.fronJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
