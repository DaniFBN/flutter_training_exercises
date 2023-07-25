import 'package:flutter/material.dart';

import 'color_extension.dart';

class AppTheme {
  static final light = ThemeData(
    primaryColor: const Color(0xFFfedc13),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFFfedc13),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: const ColorScheme.light(primary: Colors.black26),
    // dividerColor: Colors.red,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      hintStyle: TextStyle(fontSize: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(400)),
        borderSide: BorderSide.none,
      ),
    ),
    extensions: [
      ColorExtension(secondary: const Color(0xFF18ac57)),
    ],
  );
}
