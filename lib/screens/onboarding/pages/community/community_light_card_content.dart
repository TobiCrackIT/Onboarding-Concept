import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/onboarding/widgets/icon_container.dart';

class CommunityLightCardContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconContainer(
          icon: Icons.person,
          padding: kPaddingSmall,
        ),
        IconContainer(
          icon: Icons.group,
          padding: kPaddingMedium,
        ),
        IconContainer(
          icon: Icons.insert_emoticon,
          padding: kPaddingSmall,
        ),
      ],
    );
  }
}
