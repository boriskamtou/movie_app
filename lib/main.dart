import 'package:flutter/material.dart';
import 'package:movie_app/screens/about_user_screen/about_user_screen.dart';
import 'package:movie_app/screens/menu_screen/menu_screen.dart';
import 'package:movie_app/screens/sign_up_screen/sign_up_screen.dart';

import 'screens/home_screen/home_screen.dart';
import 'screens/sign_in_screen/sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: Color(0xFF575656),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        AboutUserScreen.routeName: (ctx) => AboutUserScreen(),
        MenuScreen.routeName: (ctx) => MenuScreen(),
      },
    );
  }
}
