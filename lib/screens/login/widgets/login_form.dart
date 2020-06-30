import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/login/widgets/custom_button.dart';

import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? kSpaceMedium : kSpaceSmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingLarge),
      child: Column(
        children: <Widget>[
          CustomInputField(
            label: 'Username or Email',
            prefixIcon: Icons.person,
          ),
          SizedBox(height: space),
          CustomInputField(
            label: 'Password',
            prefixIcon: Icons.lock,
            obscureText: true,
          ),
          SizedBox(height: 3 * space),
          CustomButton(
              color: kTomatoRed,
              textColor: kWhite,
              text: 'Login to continue',
              onPressed: () {}),
          SizedBox(height: space),
          CustomButton(
              color: kWhite,
              textColor: kBlack.withOpacity(0.5),
              image: Image(image: AssetImage(kGoogleLogoPath),height: 48.0,),
              text: 'Continue with Google',
              onPressed: (){}),
          SizedBox(height: space),
          CustomButton(
            color: kBlack,
            textColor: kWhite,
            text: 'Create Account',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
