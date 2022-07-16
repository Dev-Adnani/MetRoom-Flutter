import 'package:flutter/material.dart';

class SnackUtil {
  static stylishSnackBar({
    required String text,
    required BuildContext context,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 1),
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 100),
      content: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }

  static showSnackBar({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      stylishSnackBar(
        text: text,
        context: context,
        backgroundColor: backgroundColor,
        textColor: textColor,
      ),
    );
  }
}
