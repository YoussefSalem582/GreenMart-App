import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextsStyles {
  // HeadLine
  static const TextStyle headline = TextStyle(
    fontSize: 48,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    // height: 48 / 24, //2
    // letterSpacing: 0,
    color: AppColors.black,
  );

  // Body
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    color: AppColors.black,
  );

  // Title
  static const TextStyle title = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  // SubTitle
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  // Caption
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    color: AppColors.black,
  );
}
