import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/styles.dart';
import 'package:movie_app/providers/auth.dart';
import 'package:movie_app/screens/about_user_screen/about_user_screen.dart';
import 'package:movie_app/widgets/background_orange.dart';
import 'package:movie_app/widgets/input_separator.dart';
import 'package:movie_app/widgets/large_button.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up-screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerRetypePassword = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _retypePasswordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerRetypePassword.dispose();
  }

  void _saveForm() {
    final isFormValid = _form.currentState.validate();

    if (!isFormValid) {
      return;
    }
    Provider.of<Auth>(context, listen: false).signup(_controllerEmail.text, _controllerPassword.text);
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              BackgroundOrange(),
              Positioned(
                top: 32,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: kWhite,
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 150),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 80,
                          ),
                          Form(
                            key: _form,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _controllerEmail,
                                  textAlign: TextAlign.end,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: kColorFocusInput,
                                  focusNode: _emailFocusNode,
                                  textInputAction: TextInputAction.next,
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
                                  decoration: InputDecoration(
                                    hintText: 'E-mail',
                                    hintStyle: kStyleInsideInputSignUp,
                                    prefixIcon: Icon(Icons.email),
                                    focusedBorder: kFocusBorder,
                                    border: OutlineInputBorder(
                                      borderSide: kBorderSideInputSignUp,
                                    ),
                                  ),
                                ),
                                InputSeparator(),
                                TextFormField(
                                  controller: _controllerPassword,
                                  textAlign: TextAlign.end,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  cursorColor: kColorFocusInput,
                                  focusNode: _passwordFocusNode,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a pssword';
                                    }
                                    if (value.length < 8) {
                                      return 'At least 8 characters';
                                    }
                                    return null;
                                  },
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_retypePasswordFocusNode);
                                  },
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: kStyleInsideInputSignUp,
                                    prefixIcon: Icon(Icons.https),
                                    focusedBorder: kFocusBorder,
                                    border: OutlineInputBorder(
                                      borderSide: kBorderSideInputSignUp,
                                    ),
                                  ),
                                ),
                                InputSeparator(),
                                TextFormField(
                                  controller: _controllerRetypePassword,
                                  textAlign: TextAlign.end,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  cursorColor: kColorFocusInput,
                                  focusNode: _retypePasswordFocusNode,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a pssword';
                                    }
                                    if (value.length < 8) {
                                      return 'At least 8 characters';
                                    }
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  decoration: InputDecoration(
                                    hintText: 'Re-type Password',
                                    hintStyle: kStyleInsideInputSignUp,
                                    prefixIcon: Icon(Icons.https),
                                    focusedBorder: kFocusBorder,
                                    border: OutlineInputBorder(
                                      borderSide: kBorderSideInputSignUp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InputSeparator(),
                          LargeButton(
                            text: 'Sign Up',
                            onPressed: () {
                              //TODO:
                            _saveForm();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: MediaQuery.of(context).size.width / 2 - 106.5,
                child: Image.asset('assets/images/img3.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
