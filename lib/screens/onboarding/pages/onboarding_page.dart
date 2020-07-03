import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/onboarding/widgets/cards_stack.dart';

class OnboardingPage extends StatelessWidget {

  final int number;
  final Widget darkCardChild;
  final Widget lightCardChild;
  final Widget textColumn;

  const OnboardingPage({
    @required this.number,
    @required this.darkCardChild,
    @required this.lightCardChild,
    @required this.textColumn
  }):assert(number!=null),assert(darkCardChild!=null),assert(lightCardChild!=null),assert(textColumn!=null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(pageNumber: number, lightCardChild: lightCardChild, darkCardChild: darkCardChild),
        SizedBox(height: number%2==1?50.0:25.0,),
        AnimatedSwitcher(
          duration: kCardAnimationDuration,
            child: textColumn
        )
      ],
    );
  }
}
