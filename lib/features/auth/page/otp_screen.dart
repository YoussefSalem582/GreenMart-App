import 'package:flutter/material.dart';
import 'package:greenmart/core/functions/app_navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';
import 'package:greenmart/core/widgets/app_text_form_field.dart';
import 'package:greenmart/features/auth/page/otp_verification_screen.dart';

import '../../../core/widgets/app_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter your mobile number',
                    style: AppTextsStyles.title.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We need to verify you. We will send you a one time verification code. ',
                    style: AppTextsStyles.subtitle.copyWith(
                      color: AppColors.textSubtitleColor,
                    ),
                  ),
                  SizedBox(height: 48),
                  AppTextFormField(
                    hintText: '01X XXX XXXX',
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 48),
                  AppButton(
                    text: 'Next',
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        pushReplacement(context, OtpVerificationScreen());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
