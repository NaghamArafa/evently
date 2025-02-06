import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppStyles {
  static const TextStyle titleStyle = TextStyle(
      color: AppColors.purple, fontWeight: FontWeight.bold, fontSize: 20);
  static const TextStyle desStyle = TextStyle(
      color: AppColors.black, fontWeight: FontWeight.w500, fontSize: 16);
}
