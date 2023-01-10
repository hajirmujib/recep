import 'package:flutter/material.dart';

class Palette {
  static const primary = Color(0xFF1FCC79);
  static const secondary = Color(0xFFFF6464);

  static const black = Color(0xFF060A20);
  static const white = Color(0xFFFFFFFF);

  static const outline = Color(0xFFD0DBEA);
  static const form = Color(0xFFF4F5F7);
  static const gray = Color(0XFF9FA5C0);
  static const darkBlue = Color(0xff0C73C2);
  static var listShadow = <BoxShadow>[
    BoxShadow(
      color: gray.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
}
