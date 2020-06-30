import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';

class CommunityDarkCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: kPaddingLarge),
          child: Icon(
            Icons.brush,
            color: kWhite,
            size: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: kPaddingLarge),
          child: Icon(
            Icons.camera_alt,
            color: kWhite,
            size: 32.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kPaddingLarge),
          child: Icon(
            Icons.straighten,
            color: kWhite,
            size: 32.0,
          ),
        ),
      ],
    );
  }
}
