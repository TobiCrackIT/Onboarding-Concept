import 'package:flutter/material.dart';
import 'package:onboarding/screens/onboarding/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Onboarding Style',
      debugShowCheckedModeBanner: false,
      home:Builder(
        builder: (BuildContext context){
          var screenHeight = MediaQuery.of(context).size.height;

          return Onboarding(
            screenHeight: screenHeight,
          );
        },
      ),
    );
  }
}

