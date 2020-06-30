import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/login/widgets/clippers/grey_top_clipper.dart';
import 'package:onboarding/screens/login/widgets/clippers/red_top_clipper.dart';
import 'package:onboarding/screens/login/widgets/header.dart';

import 'widgets/clippers/white_top_clipper.dart';
import 'widgets/login_form.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: Stack(
        children: <Widget>[
          /*ClipPath(
            clipper: RedTopClipper(),
            child: Container(
              color: kWhite,
            ),
          ),
          ClipPath(
            clipper: GreyTopClipper(),
            child: Container(
              color: kTomatoRed,
            ),
          ),*/
          ClipPath(
            clipper: WhiteTopClipper(),
            child: Container(
              color: kGrey,
            ),
          ),

          ClipPath(
            clipper: GreyTopClipper(),
            child: Container(
              color: kTomatoRed,
            ),
          ),
          ClipPath(
            clipper: RedTopClipper(),
            child: Container(
              color: kWhite,
            ),
          ),

          SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: kPaddingLarge),
                child: Column(
                  children: <Widget>[
                    Header(),
                    Spacer(),
                    LoginForm(),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}
