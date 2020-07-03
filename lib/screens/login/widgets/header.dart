import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/login/widgets/fade_slide_transition.dart';
import 'package:onboarding/utils/config.dart';
import 'package:onboarding/widgets/logo.dart';

class Header extends StatelessWidget {

  final Animation<double> animation;
  Header({this.animation}):assert(animation!=null);

  final Config _config=Config();


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Logo(color: kTomatoRed, size: 48.0),
          const SizedBox(height: kSpaceMedium),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              //'Welcome to Busby',
              _config.appTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: kBlack, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: kSpaceSmall),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              //'The goto place for everything involving education, work and community.',
              _config.appSubtitle,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: kBlack.withOpacity(0.5)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
