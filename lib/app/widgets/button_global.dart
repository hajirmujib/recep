import 'package:flutter/material.dart';

import '../constants/pallete.dart';

class ButtonGlobal extends StatelessWidget {
  final double height;
  final double radius;
  final Widget child;
  final Color primary;
  final Color sideColor;
  final VoidCallback onTap;
  final bool enabled;

  const ButtonGlobal(
      {Key? key,
      this.height = 56,
      this.radius = 32,
      this.enabled = true,
      this.primary = Palette.primary,
      this.sideColor = Colors.transparent,
      required this.onTap,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              primary: enabled ? primary : Palette.gray,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: enabled ? sideColor : Palette.gray),
                  borderRadius: BorderRadius.circular(radius))),
          child: child),
    );
  }
}
