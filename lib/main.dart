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
      home:Onboarding(),
    );
  }
}

