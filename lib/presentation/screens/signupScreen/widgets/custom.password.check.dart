import 'package:flutter/material.dart';

class CustomAnimatedContainer {
  static customAnimatedContainer(
      {required double height,
      required double width,
      required BuildContext context,
      required Color color,
      required Curve curve}) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      curve: curve,
    );
  }
}