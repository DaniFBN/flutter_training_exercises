import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: const Color(0xFFff8700),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFff8700)),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFf4f3f8),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFf4f3f8),
    ),
    dividerTheme: const DividerThemeData(color: Color(0xFFf4f3f8)),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Color(0xFF9da4ae)),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFFff8700),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFFff8700),
      unselectedItemColor: Color(0xFF9da4ae),
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}
