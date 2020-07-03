import 'package:flutter/material.dart';

class RedTopClipper extends CustomClipper<Path>{

  final double yOffset;
  RedTopClipper({this.yOffset}):assert(yOffset!=null);


  @override
  Path getClip(Size size) {
    var path=Path()
        ..lineTo(0, 220+yOffset)
        ..quadraticBezierTo(size.width/2.2, 260+yOffset, size.width, 170+yOffset)
        ..lineTo(size.width, 0.0)
        ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}