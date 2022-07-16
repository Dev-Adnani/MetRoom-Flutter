import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metroom/app/constants/app.assets.dart';
import 'package:metroom/app/constants/app.colors.dart';
import 'package:metroom/presentation/widgets/custom.styles.dart';

Widget noDataFound({required bool themeFlag, required String text}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.nodata),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: kBodyText.copyWith(
            color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
