import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spend_snap/app_routers.dart';
import 'package:spend_snap/config/constants.dart';
import 'package:spend_snap/config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(child: SpendSnap()),
  );
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
      debugShowCheckedModeBanner: true,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
