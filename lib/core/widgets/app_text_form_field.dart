import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.enabled = true,
    this.onTap,
    this.onChanged,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  // to handle input validations
  final String? Function(String?)? validator;
  // to enable or disable the text form field
  final bool enabled;
  // to handle on tap event
  final Function()? onTap;
  // to handle on changed event
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        //labelText: 'Email',
        hintText: hintText ?? 'example@gmail.com',
        hintStyle: AppTextsStyles.caption.copyWith(
          color: AppColors.textSubtitleColor,
        ),
      ),
      // to handle input validations
      validator: validator,
      // to handle on tap event
      onTap: onTap,
      // to handle on changed event
      onChanged: onChanged,
    );
  }
}
