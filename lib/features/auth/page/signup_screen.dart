import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';
import 'package:greenmart/core/widgets/app_button.dart';
import 'package:greenmart/core/widgets/app_password_form_field.dart';
import 'package:greenmart/core/widgets/app_text_form_field.dart';
import 'package:greenmart/features/auth/page/otp_screen.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/functions/app_navigations.dart';
import 'login_screen.dart';

// to handle input validations
// 1) wrap with form widget
// 2) create formKey and pass it to form widget
// 3) add validators for each field
// 4) check if formKey.currentState!.validate() is true when onPressed is called

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // form key to handle input validations
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // SingleChildScrollView to avoid overflow when keyboard appears
          child: SingleChildScrollView(
            child: Form(
              // to handle input validations
              key: formKey,
              // to validate on field unfocus
              autovalidateMode: AutovalidateMode.onUnfocus,
              // Column to arrange widgets vertically
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // logo
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: SvgPicture.asset(AppImages.logoSvg),
                  ),
                  // space
                  SizedBox(height: 40),
                  // Title Text
                  Text('Sign up', style: AppTextsStyles.title),
                  // space
                  SizedBox(height: 16),
                  // subtitle text
                  Text(
                    'Enter your email and password',
                    style: AppTextsStyles.caption.copyWith(
                      color: AppColors.textSubtitleColor,
                    ),
                  ),
                  // space
                  SizedBox(height: 40),

                  /// Name form section
                  // Title Text
                  Text(
                    'Name',
                    style: AppTextsStyles.caption.copyWith(
                      color: AppColors.textSubtitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // space
                  SizedBox(height: 8),
                  // email text form field
                  AppTextFormField(
                    hintText: 'Enter your name',
                    keyboardType: TextInputType.name,
                    // email validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Name';
                      }
                      return null;
                    },
                  ),
                  // space
                  SizedBox(height: 16),

                  /// Email form section
                  // Title Text
                  Text(
                    'Email',
                    style: AppTextsStyles.caption.copyWith(
                      color: AppColors.textSubtitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // space
                  SizedBox(height: 8),
                  // email text form field
                  AppTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // email validator
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  // space
                  SizedBox(height: 16),

                  /// Password form section
                  // Title Text
                  Text(
                    'Password',
                    style: AppTextsStyles.caption.copyWith(
                      color: AppColors.textSubtitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // space
                  SizedBox(height: 8),
                  // email text form field
                  AppPasswordFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),

                  // space
                  SizedBox(height: 20),
                  // button
                  AppButton(
                    text: 'Sign up',
                    onPressed: () {
                      if (formKey.currentState!.validate() == true) {
                        pushTo(context, OtpScreen());
                      }
                    },
                  ),
                  // space
                  SizedBox(height: 20),
                  // sign up text button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // sign up text
                      Text(
                        'Already have an account ?',
                        style: AppTextsStyles.caption.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // sign up text button
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          pushReplacement(context, LoginScreen());
                        },
                        child: Text(
                          'Log in',
                          style: AppTextsStyles.caption.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
