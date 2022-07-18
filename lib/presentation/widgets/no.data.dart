import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metroom/app/constants/app.assets.dart';

Widget noDataFound({required bool themeFlag}) {
  return Center(
    child: Image.asset(
      themeFlag ? AppAssets.noDataLight : AppAssets.noDataDark,
    ),
  );
}
