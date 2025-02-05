import 'package:evently/event/utl/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  ThemeData light = ThemeData(
      primaryColor: AppColors.purple,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple));

  ThemeData dark = ThemeData(
      primaryColor: AppColors.darkPurple,
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple));
}
