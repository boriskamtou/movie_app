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
