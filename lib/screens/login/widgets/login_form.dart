import 'package:flutter/material.dart';
import 'package:onboarding/constants.dart';
import 'package:onboarding/screens/login/widgets/custom_button.dart';
import 'package:onboarding/screens/login/widgets/fade_slide_transition.dart';

import 'custom_input_field.dart';

class LoginForm extends StatelessWidget {

  final Animation<double> animation;

  const LoginForm({
    @required this.animation,
  }) : assert(animation != null);


  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? kSpaceMedium : kSpaceSmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingLarge),
      child: Column(
        children: <Widget>[
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: CustomInputField(
              label: 'Username or Email',
              prefixIcon: Icons.person,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            additionalOffset: space,
            animation: animation,
            child: CustomInputField(
              label: 'Password',
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
          ),
          SizedBox(height: 3 * space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
                color: kTomatoRed,
                textColor: kWhite,
                text: 'Login to continue',
                onPressed: () {}),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            additionalOffset: 3 * space,
            animation: animation,
            child: CustomButton(
                color: kWhite,
                textColor: kBlack.withOpacity(0.5),
                image: Image(image: AssetImage(kGoogleLogoPath),height: 48.0,),
                text: 'Continue with Google',
                onPressed: (){}),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: CustomButton(
              color: kBlack,
              textColor: kWhite,
              text: 'Create Account',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
