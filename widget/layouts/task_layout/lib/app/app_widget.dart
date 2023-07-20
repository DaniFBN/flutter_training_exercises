import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
          isDense: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
