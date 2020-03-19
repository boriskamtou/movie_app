import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;

  LargeButton({
    @required this.text,
    @required this.onPressed,
    this.color = const Color(0xFFFF6600),
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      elevation: 0.75,
      color: color,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
