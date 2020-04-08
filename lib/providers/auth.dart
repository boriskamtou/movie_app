import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/user.dart';

class Auth with ChangeNotifier {
  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBu0O3yN_aqW0wMjrTTpaopiBfWcdiTzC8';

    final response = await http.post(
      url,
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      return User.fronJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Sign Up');
    }
  }
}
