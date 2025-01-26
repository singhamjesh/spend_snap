import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueGrey.shade700,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey.shade700,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.blueGrey.shade100,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.grey.shade300,
        elevation: 3,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueGrey.shade600,
        textTheme: ButtonTextTheme.primary,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.blueGrey.shade700,
          hoverColor: Colors.blueGrey.shade100,
          padding: const EdgeInsets.all(8),
          iconSize: 24,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blueGrey.shade700,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey.shade700,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          iconColor: Colors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blueGrey.shade700,
          side: BorderSide(color: Colors.blueGrey.shade700),
        ),
      ),
      textTheme: TextTheme(
        displayLarge:
            const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.blueGrey.shade800),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.blueGrey.shade600),
        titleMedium: TextStyle(fontSize: 14, color: Colors.blueGrey.shade600),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueGrey.shade900,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey.shade900,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.blueGrey.shade800,
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF1E1E1E),
        shadowColor: Colors.blueGrey.shade800,
        elevation: 3,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueGrey.shade800,
        textTheme: ButtonTextTheme.primary,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: Colors.blueGrey.shade800,
          hoverColor: Colors.blueGrey.shade100,
          padding: const EdgeInsets.all(8),
          iconSize: 24,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blueGrey.shade300,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey.shade800,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          iconColor: Colors.white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blueGrey.shade300,
          side: BorderSide(color: Colors.blueGrey.shade300),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
        titleLarge: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.white60),
        titleMedium: TextStyle(fontSize: 14, color: Colors.white60),
      ),
    );
  }

  // System Theme
  static ThemeMode get systemTheme => ThemeMode.system;
}
