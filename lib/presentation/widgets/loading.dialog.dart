import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.colors.dart';

class LoadingDialog {
  static showLoaderDialog(
      {required BuildContext context, required bool themeFlag}) {
    AlertDialog alert = AlertDialog(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      content: Row(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            width: 5,
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: Text(
              "Loading...",
              style: TextStyle(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
            ),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
