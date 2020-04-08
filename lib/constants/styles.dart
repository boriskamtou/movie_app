import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle kStyleInsideInputSignUp = TextStyle(
  color: Color(0xFF545454),
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

BorderSide kBorderSideInputSignUp = BorderSide(
  width: 1,
  color: Color(0xFFCECECE),
);

InputBorder kFocusBorder = OutlineInputBorder(
  borderSide: BorderSide(
    width: 2,
    color: kColorFocusInput,
  ),
);

TextStyle kHintTextStyle = TextStyle(
  color: Color(0xFF9E9E9E),
);

InputDecoration kInputDecorator = InputDecoration(
  hintText: 'Password',
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
      color: kColorFocusInput,
    ),
  ),
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(
    vertical: 18,
    horizontal: 18,
  ),
  prefixIcon: Icon(
    Icons.https,
  ),
  focusColor: kColorFocusInput,
  fillColor: kInputBackgroundColor,
  filled: true,
);
