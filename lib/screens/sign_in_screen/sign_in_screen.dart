import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/widgets/input_separator.dart';
import 'package:movie_app/widgets/large_button.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in-screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(
            top: 50,
            left: 32,
            right: 32,
          ),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/img2.png'),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xFF3D0A0A),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                    focusColor: kColorFocusInput,
                    fillColor: kInputBackgroundColor,
                    filled: true,
                  ),
                ),
                InputSeparator(),
                TextField(
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),
                    prefixIcon: Icon(Icons.pan_tool),
                    focusColor: kColorFocusInput,
                    fillColor: kInputBackgroundColor,
                    filled: true,
                  ),
                ),
                InputSeparator(),
                Container(
                  width: double.infinity,
                  child: LargeButton(
                    text: 'GO',
                    onPressed: () {},
                  ),
                ),
                InputSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _isChecked,
                            checkColor: kWhite,
                            activeColor: kInputBackgroundColor,
                            onChanged: (bool newVal) {
                              setState(() {
                                _isChecked = newVal;
                              });
                            },
                          ),
                          Text(
                            'Remenber',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //TODO:
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFAAA5A5),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                InputSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Forgot',
                      style: TextStyle(
                        color: Color(0xFF50504E),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () {
                        //TODO:
                      },
                      child: Text(
                        'password?',
                        style: TextStyle(
                          color: kColorFocusInput,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
