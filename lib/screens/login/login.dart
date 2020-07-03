import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/login/widgets/clippers/grey_top_clipper.dart';
import 'package:onboarding/screens/login/widgets/clippers/red_top_clipper.dart';
import 'package:onboarding/screens/login/widgets/header.dart';

import 'widgets/clippers/white_top_clipper.dart';
import 'widgets/login_form.dart';

class Login extends StatefulWidget {

  final double screenHeight;
  Login({this.screenHeight});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<double> _headerAnimation;
  Animation<double> _formAnimation;
  Animation<double> _whiteTopClipperAnimation;
  Animation<double> _redTopClipperAnimation;
  Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {

    super.initState();
    _animationController=AnimationController(vsync: this,duration: kLoginAnimationDuration);

    var fadeSlideTween=Tween<double>(begin: 0.0,end: 1.0);

    var clipperOffsetTween=Tween<double>(begin: widget.screenHeight,end: 0.0);
    
    _headerAnimation=fadeSlideTween.animate(
        CurvedAnimation(
            parent: _animationController, 
            curve: Interval(0.0, 0.6,curve: Curves.easeInOut),
        ),
    );

    _formAnimation=fadeSlideTween.animate(
      CurvedAnimation(parent: _animationController, curve: Interval(0.7, 1.0,curve: Curves.easeInOut))
    );

    _redTopClipperAnimation=clipperOffsetTween.animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.2, 0.4,curve: Curves.easeInOut),
        ),
    );

    _greyTopClipperAnimation=clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.35, 0.5,curve: Curves.easeInOut),
      ),
    );

    _whiteTopClipperAnimation=clipperOffsetTween.animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 0.7,curve: Curves.easeInOut),
        ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


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
          
          
          AnimatedBuilder(
              animation: _whiteTopClipperAnimation,
              child: Container(
                color: kGrey,
              ),
              builder: (_,Widget child){
                return ClipPath(
                  clipper: WhiteTopClipper(
                    yOffset:_whiteTopClipperAnimation.value
                  ),
                  child: child,
                );
              },
          ),
          
          AnimatedBuilder(
              animation: _greyTopClipperAnimation,
              child: Container(
                color: kTomatoRed,
              ),
              builder: (_,Widget child){
                return ClipPath(
                  clipper: GreyTopClipper(
                    yOffset: _greyTopClipperAnimation.value
                  ),
                  child: child,
                );
              },
          ),

          AnimatedBuilder(
              animation: _animationController,
              child: Container(
                color: kWhite,
              ),
              builder: (_,Widget child){
                return ClipPath(
                  clipper: RedTopClipper(
                    yOffset: _redTopClipperAnimation.value
                  ),
                  child: child,
                );
              },
          ),


          SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: kPaddingLarge),
                child: Column(
                  children: <Widget>[
                    Header(
                      animation: _headerAnimation,
                    ),
                    Spacer(),
                    LoginForm(
                      animation: _formAnimation,
                    ),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}
