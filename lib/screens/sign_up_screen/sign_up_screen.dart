import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/styles.dart';
import 'package:movie_app/screens/about_user_screen/about_user_screen.dart';
import 'package:movie_app/widgets/background_orange.dart';
import 'package:movie_app/widgets/input_separator.dart';
import 'package:movie_app/widgets/large_button.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign-up-screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerRetypePassword = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _retypePasswordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerRetypePassword.dispose();
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
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _controllerName,
                                  textAlign: TextAlign.end,
                                  keyboardType: TextInputType.text,
                                  cursorColor: kColorFocusInput,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_emailFocusNode);
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: kStyleInsideInputSignUp,
                                    prefixIcon: Icon(Icons.person_outline),
                                    focusedBorder: kFocusBorder,
                                    border: OutlineInputBorder(
                                      borderSide: kBorderSideInputSignUp,
                                    ),
                                  ),
                                ),
                                InputSeparator(),
                                TextFormField(
                                  controller: _controllerEmail,
                                  textAlign: TextAlign.end,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: kColorFocusInput,
                                  focusNode: _emailFocusNode,
                                  textInputAction: TextInputAction.next,
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
                              Navigator.of(context)
                                  .pushNamed(AboutUserScreen.routeName);
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
