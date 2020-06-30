import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final String text;
  final Widget image;

  const CustomButton({
    @required this.color,
    @required this.textColor,
    @required this.text,
    @required this.onPressed,
    this.image,
  })  : assert(color != null),
        assert(textColor != null),
        assert(text != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: image != null
          ? OutlineButton(
          onPressed: onPressed,
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: kPaddingLarge),
              child: image,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      )
          : FlatButton(
            color: color,
            padding: const EdgeInsets.all(kPaddingMedium),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
    );
  }
}
