import 'dart:math';

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final Color color;
  final double size;

  const Logo({
    @required this.color,
    @required this.size,
  })  : assert(color != null),
        assert(size != null);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -pi/3,
        child: Icon(
          Icons.color_lens,
          color: color,
          size: size,
        ),
    );
  }
}
