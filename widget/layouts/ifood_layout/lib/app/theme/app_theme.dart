import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    cardColor: Colors.grey.shade200,
    primaryColor: Colors.red.shade800,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade800),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(color: Colors.black),
      backgroundColor: Colors.grey.shade50,
      iconTheme: IconThemeData(
        color: Colors.red.shade800,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.red.shade800,
      ),
    ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: Colors.black87),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.black54,
      labelColor: Colors.red.shade800,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.red.shade800),
        ),
      ),
    ),
  );
}
