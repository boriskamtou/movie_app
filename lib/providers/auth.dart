import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

  bool get isAuth {
    return _token != null;
  }

   String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    try {
      final url =
          'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBu0O3yN_aqW0wMjrTTpaopiBfWcdiTzC8';

      final response = await http.post(
        url,
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      final responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw HttpException(message: 'Error sign up');
      }

      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );

      print(response.body);
      print('User id = ' + _userId);

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signin(String email, String password) async {
    return _authenticate(email, password, 'signInWithIdp');
  }
}
