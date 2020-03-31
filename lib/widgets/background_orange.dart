import 'package:flutter/material.dart';

class BackgroundOrange extends StatelessWidget {
  final double height;

  BackgroundOrange({this.height = 250});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFF0700),
            Color(0xFFFF8800),
          ],
        ),
      ),
    );
  }
}
