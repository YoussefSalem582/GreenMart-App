import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenmart/core/constants/app_images.dart';
import 'package:greenmart/core/functions/app_navigations.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // delay 2 seconds before navigating to onboarding screen
    Future.delayed(Duration(seconds: 3), () {
      pushReplacement(context, const OnboardingScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset(AppImages.fullLogoSvg)),
    );
  }
}
