import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/widgets/logo.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: kPaddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Logo(color: kTomatoRed, size: 48.0),
          const SizedBox(height: kSpaceMedium),
          Text(
            'Welcome to Busby',
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kBlack, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kSpaceSmall),
          Text(
            'The goto place for everything involving education, work and community.',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(color: kBlack.withOpacity(0.5)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
