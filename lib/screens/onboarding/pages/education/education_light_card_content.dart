import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/onboarding/widgets/icon_container.dart';

class EducationLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.brush,
          padding: kPaddingSmall,
        ),
        IconContainer(
          icon: Icons.camera_alt,
          padding: kPaddingMedium,
        ),
        IconContainer(
          icon: Icons.straighten,
          padding: kPaddingSmall,
        ),
      ],
    );
  }
}