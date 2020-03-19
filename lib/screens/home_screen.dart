import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/large_button.dart';

import 'sign_in_screen/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70),
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
                  ),
                  Positioned(
                    top: 120,
                    left: MediaQuery.of(context).size.width / 2 - 125.5,
                    child: Image.asset('assets/images/img1.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5D5D5D),
                  fontSize: 29,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'The interaction of the corporation &\n' +
                    'the customer pushes the institutional\n' +
                    'corporate identity',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFA29A9A),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: LargeButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    //TODO:
                    Navigator.of(context).pushNamed(SignInScreen.routeName);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: LargeButton(
                  text: 'SIGN UP',
                  color: Color(0xFF8A8AFF),
                  onPressed: () {
                    //TODO:
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
