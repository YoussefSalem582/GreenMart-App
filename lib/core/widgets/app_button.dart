import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 67,
    this.textStyle,
    this.backgroundColor = AppColors.primaryColor,
  });
  final String text;
  final Function() onPressed;
  final Color backgroundColor;
  final double width;
  final double height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        minimumSize: Size(width, height),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            textStyle ??
            AppTextsStyles.body.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
