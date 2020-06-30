import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';

class CustomInputField extends StatelessWidget {

  final String label;
  final IconData prefixIcon;
  final bool obscureText;

  const CustomInputField({
    @required this.label,
    @required this.prefixIcon,
    this.obscureText = false,
  })  : assert(label != null),
        assert(prefixIcon != null);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(kPaddingMedium),
        hintText: label,
        hintStyle: TextStyle(
          color: kBlack.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: kBlack.withOpacity(0.5),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: kRealBlack.withOpacity(0.12)
          )
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: kRealBlack.withOpacity(0.12)
            )
        )

      ),
      obscureText: obscureText,
    );
  }
}
