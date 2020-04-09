import 'dart:ui';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/styles.dart';
import 'package:movie_app/providers/auth.dart';
import 'package:movie_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:movie_app/widgets/input_separator.dart';
import 'package:movie_app/widgets/large_button.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/models/http_exception.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in-screen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordFocusNode = FocusNode();
  final GlobalKey<FormState> _form = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isChecked = true;

  void _savedForm() async {
    bool _isValid = _form.currentState.validate();
    if (!_isValid) {
      return;
    }
    _form.currentState.save();

    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Auth>(context, listen: false)
          .signin(_emailController.text, _passwordController.text);
    } on HttpException catch (error) {
      var errorMessage = 'Login failed';
      if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email not found';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password';
      } else if (error.toString().contains('USER_DISABLED')) {
        errorMessage = 'This account has been disable';
      }
      print(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      print(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: kOrangeHellColor,
      ),
      child: Scaffold(
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
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          cursorColor: kColorFocusInput,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide an email';
                            }
                            if (!value.contains('@')) {
                              return 'Please provide a valid email';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_passwordFocusNode);
                          },
                          textInputAction: TextInputAction.next,
                          decoration: kInputDecorator.copyWith(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          onSaved: (value) {},
                        ),
                        InputSeparator(),
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          textAlign: TextAlign.center,
                          cursorColor: kColorFocusInput,
                          focusNode: _passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          decoration: kInputDecorator,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please provide a password';
                            }
                            if (value.length < 8) {
                              return 'At least 8 characters';
                            }
                            return null;
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
                      onPressed: () => _savedForm(),
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
                          Navigator.of(context)
                              .pushNamed(SignUpScreen.routeName);
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
      ),
    );
  }
}
