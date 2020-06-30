import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/onboarding/widgets/icon_container.dart';

class WorkLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.event_seat,
          padding: kPaddingSmall,
        ),
        IconContainer(
          icon: Icons.business_center,
          padding: kPaddingMedium,
        ),
        IconContainer(
          icon: Icons.assessment,
          padding: kPaddingSmall,
        ),
      ],
    );
  }
}