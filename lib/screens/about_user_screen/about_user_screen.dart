import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/styles.dart';
import 'package:movie_app/screens/menu_screen/menu_screen.dart';
import 'package:movie_app/widgets/background_orange.dart';
import 'package:movie_app/widgets/input_separator.dart';
import 'package:movie_app/widgets/large_button.dart';

class AboutUserScreen extends StatefulWidget {
  static const routeName = '/about-user-screen';

  @override
  _AboutUserScreenState createState() => _AboutUserScreenState();
}

class _AboutUserScreenState extends State<AboutUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              BackgroundOrange(
                height: 290,
              ),
              Positioned(
                top: 32,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: kWhite,
                  ),
                  onPressed: () {
                    //TODO:
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                top: 44,
                left: MediaQuery.of(context).size.width / 2 - 87,
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/img4.png'),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Short story about\nyourself',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Transform.translate(
                  offset: Offset(0, 250),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        maxLines: 8,
                        keyboardType: TextInputType.multiline,
                        cursorColor: kColorFocusInput,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Start typing...',
                          hintStyle: kHintTextStyle,
                          focusedBorder: kFocusBorder,
                          border: OutlineInputBorder(
                            borderSide: kBorderSideInputSignUp,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          fillColor: kWhite,
                          filled: true,
                        ),
                      ),
                      InputSeparator(),
                      LargeButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(MenuScreen.routeName);
                        },
                        text: 'NEXT',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
