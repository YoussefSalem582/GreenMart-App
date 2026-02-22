import 'package:flutter/material.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';

class AppPasswordFormField extends StatefulWidget {
  const AppPasswordFormField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  // to handle input validations
  final String? Function(String?)? validator;

  @override
  State<AppPasswordFormField> createState() => _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.suffixIcon ??
            IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            ),
        hintText: widget.hintText ?? '*************',
        hintStyle: AppTextsStyles.caption.copyWith(
          color: AppColors.textSubtitleColor,
        ),
      ),
      // to handle input validations
      validator: widget.validator,
    );
  }
}
