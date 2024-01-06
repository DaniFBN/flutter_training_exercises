import 'package:flutter/material.dart';

import 'color_extension.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    primaryColor: const Color(0xFFff8700),
    colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFff8700)),
    scaffoldBackgroundColor: const Color(0xFFf4f3f8),
    dividerTheme: const DividerThemeData(color: Color(0xFFf4f3f8)),
    primaryIconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      titleSmall: TextStyle(color: Color(0xFF9da4ae)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFFff8700)),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFf4f3f8),
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
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Colors.black54,
      labelColor: Color(0xFFff8700),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFFff8700)),
        ),
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
    extensions: [
      ColorExtension(
        percentageBackground: Colors.black12,
        taskCardSelected: const Color(0xFFe9e9f1),
        taskImageCardSelected: const Color(0xFFedecf1),
        taskTextSelected: const Color(0xFF9da0a9),
        calendarCurrentDay: Colors.grey.shade200,
        calendarCurrentDayBorder: Colors.grey.shade400,
        calendarTodayText: Colors.black,
      ),
    ],
  );
}
