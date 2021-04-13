

import 'package:flutter/material.dart';

class Circulo extends StatelessWidget {

  final List<Color> colors;
  final double size;

  const Circulo({Key key, @required this.colors, @required this.size}) 
    : assert( colors != null && colors.length >= 2),
    assert( size != null && size > 0),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        gradient: LinearGradient( colors: this.colors, begin: Alignment.topCenter, end: Alignment.bottomCenter),
        shape: BoxShape.circle
      ),
    );
  }
}