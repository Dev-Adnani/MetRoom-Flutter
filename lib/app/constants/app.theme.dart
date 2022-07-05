import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app.colors.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.creamColor,
    brightness: Brightness.dark,
    background: AppColors.mirage,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.white54,
  textTheme: GoogleFonts.exo2TextTheme(),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.mirage,
    brightness: Brightness.light,
    background: AppColors.creamColor,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.black,
  textTheme: GoogleFonts.exo2TextTheme(),
);
