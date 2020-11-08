import 'package:flutter/material.dart';

class MyClipperCard extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;

    Path p = Path();
    p.lineTo(w, 0);
    p.lineTo(w -60, h);
    p.lineTo(0, h);

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}