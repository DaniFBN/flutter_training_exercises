import 'package:flutter/material.dart';
import 'package:ifood_layout/app/theme/app_theme.dart';

import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
