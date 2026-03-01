import 'dart:io';

import 'package:flutter/material.dart';

import 'core/styles/themes.dart';
import 'features/main/main_app_screen.dart';

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
      theme: AppThemes.light,
      // SafeArea widget is used to set the safe area of the app
      builder: (context, child) {
        return SafeArea(
          bottom: Platform.isAndroid ? true : false,
          top: false,
          child: child ?? Container(),
        );
      },
      home: MainAppScreen(),
    );
  }
}
