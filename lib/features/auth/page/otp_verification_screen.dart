import 'dart:async';

import 'package:flutter/material.dart';
import 'package:greenmart/core/functions/app_navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';
import 'package:greenmart/features/auth/page/otp_screen.dart';
import 'package:greenmart/features/home/page/home_screen.dart';
import 'package:pinput/pinput.dart';

import '../../../core/widgets/app_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final formKey = GlobalKey<FormState>();
  // to handle resend OTP timer
  int _secondsRemaining = 60;
  // Timer object to handle countdown
  Timer? _timer;

  // start timer on screen load and when resend OTP is triggered
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // function to start or restart the timer
  void _startTimer() {
    // reset seconds remaining to 60
    _secondsRemaining = 60;
    // cancel any existing timer before starting a new one
    _timer?.cancel();
    // start a new timer that ticks every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // if seconds remaining is greater than 0, decrement it, otherwise cancel the timer
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  // cancel the timer when the widget is disposed
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
                    'Enter verification code',
                    style: AppTextsStyles.title.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We have sent SMS to: 01XXXXXXXXXX',
                    style: AppTextsStyles.body.copyWith(
                      color: AppColors.textSubtitleColor,
                    ),
                  ),
                  SizedBox(height: 48),
                  // OTP input fields using Pinput package
                  Center(
                    child: Pinput(
                      length: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the OTP';
                        }
                        if (value.length != 5) {
                          return 'OTP must be 5 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  // Change Phone Number button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          pushReplacement(context, OtpScreen());
                        },
                        child: Text(
                          'Change Phone Number',
                          style: AppTextsStyles.caption.copyWith(
                            color: AppColors.textSubtitleColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  AppButton(
                    text: 'Confirm',
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        pushReplacement(context, HomeScreen());
                      }
                    },
                  ),
                  SizedBox(height: 16),
                  // Resend OTP section
                  Center(
                    // Show countdown timer if seconds remaining, otherwise show resend button
                    child: _secondsRemaining > 0
                        ? Text(
                            'Resend confirmation code (0:${_secondsRemaining.toString().padLeft(2, '0')})',
                            style: AppTextsStyles.caption.copyWith(
                              color: AppColors.textSubtitleColor,
                            ),
                          )
                        // Show resend button when timer is done
                        : TextButton(
                            onPressed: () {
                              _startTimer();
                              // TODO: trigger resend OTP logic here
                            },
                            // remove padding from button
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Resend OTP',
                              style: AppTextsStyles.body.copyWith(
                                color: AppColors.orange,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
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
