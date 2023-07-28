import 'package:accessibility_response/app/theme.dart';
import 'package:flutter/material.dart';

Widget customMaterialApp(Widget home) {
  return MaterialApp(
    theme: AppTheme.lightTheme,
    home: home,
  );
}
