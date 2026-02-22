import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greenmart/core/constants/app_fonts.dart';
import 'package:greenmart/core/styles/app_colors.dart';
import 'package:greenmart/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: AppFonts.poppins,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        // colorScheme is used to set the primary color and other colors of the app
        colorScheme: ColorScheme.fromSeed(
          // seedColor is the primary color of the app
          seedColor: AppColors.primaryColor,
          // onSurface is the color of text and icons on surfaces
          onSurface: AppColors.black,
        ),
        // textButton theme to set the default text color for text buttons
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: AppColors.primaryColor),
        ),
        // input decoration theme to set the default style for text form fields
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.formColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      // SafeArea widget is used to set the safe area of the app
      builder: (context, child) {
        return SafeArea(
          bottom: Platform.isAndroid ? true : false,
          top: false,
          child: child ?? Container(),
        );
      },
      home: SplashScreen(),
    );
  }
}
