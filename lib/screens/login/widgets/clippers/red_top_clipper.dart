import 'package:flutter/material.dart';

class RedTopClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path=Path()
        ..lineTo(0, 220)
        ..quadraticBezierTo(size.width/2.2, 260, size.width, 170)
        ..lineTo(size.width, 0.0)
        ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}