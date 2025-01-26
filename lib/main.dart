import 'package:flutter/material.dart';
import 'package:spend_snap/config/constants.dart';
import 'package:spend_snap/config/theme.dart';
import 'package:spend_snap/layouts/mobile.dart';

void main() {
  runApp(const SpendSnap());
}

class SpendSnap extends StatelessWidget {
  const SpendSnap({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // themeMode: ThemeMode.dark,
      themeMode: AppTheme.systemTheme,
      debugShowCheckedModeBanner: false,
      home: const MobileLayout(title: Constants.appTitle),
    );
  }
}
