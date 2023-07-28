import 'package:accessibility_response/app/theme.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
