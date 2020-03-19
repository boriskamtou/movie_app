import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/sign_in_screen/sign_in_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        SignInScreen.routeName: (ctx) => SignInScreen(),
      },
    );
  }
}
