import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,

    fontFamily: "Gilroy",

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    useMaterial3: true,
  );
}