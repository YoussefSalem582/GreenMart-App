import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greenmart/core/constants/app_images.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/core/styles/app_texts_styles.dart';
import 'package:greenmart/core/widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background image
          Image.asset(
            AppImages.splashBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          // content'
          Positioned(
            bottom: 60,
            left: 30,
            right: 30,
            child: Column(
              children: [
                // icon
                SvgPicture.asset(
                  AppImages.logoSvg,
                  // icon color
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                // space
                SizedBox(height: 35),
                // text header
                Text(
                  'Welcome\n to our store',
                  textAlign: TextAlign.center,
                  style: AppTextsStyles.headline.copyWith(
                    color: AppColors.white,
                  ),
                ),
                // space
                SizedBox(height: 10),
                // subtitle
                Text(
                  'Ger your groceries in as fast as one hour',
                  textAlign: TextAlign.center,
                  style: AppTextsStyles.body.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 30),
                AppButton(
                  text: 'Get Started',
                  onPressed: () {},
                  textStyle: AppTextsStyles.subtitle.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
