import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';

class NextPageButton extends StatelessWidget {

  final VoidCallback onPressed;

  const NextPageButton({
    @required this.onPressed,
  }) : assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: onPressed,
      padding: const EdgeInsets.all(kPaddingMedium),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: kWhite,
      child: Icon(
        Icons.arrow_forward,
        color: kTomatoRed,
        size: 32.0,
      ),
    );
  }
}
