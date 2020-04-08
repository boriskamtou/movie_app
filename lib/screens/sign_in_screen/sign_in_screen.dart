import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/styles.dart';
import 'package:movie_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:movie_app/widgets/input_separator.dart';
import 'package:movie_app/widgets/large_button.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in-screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isChecked = true;

  void _savedForm() {
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 32, right: 32),
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
                Form(
                  key: _form,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        cursorColor: kColorFocusInput,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_passwordFocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        decoration: kInputDecorator.copyWith(
                          hintText: 'Username',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        onSaved: (value) {
                         
                        },
                      ),
                      InputSeparator(),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        cursorColor: kColorFocusInput,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        decoration: kInputDecorator,
                        onSaved: (value) {
                        
                          
                        },
                      ),
                    ],
                  ),
                ),
                InputSeparator(),
                Container(
                  width: double.infinity,
                  child: LargeButton(
                    text: 'GO',
                    onPressed: () {
                      _savedForm();
                    },
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
                          SizedBox(
                            child: Checkbox(
                              value: _isChecked,
                              checkColor: kWhite,
                              activeColor: Color(0xFF948E8E),
                              onChanged: (bool newVal) {
                                setState(() {
                                  _isChecked = newVal;
                                });
                              },
                            ),
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(
                            width: 14,
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
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFAAA5A5),
                          fontSize: 18,
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
