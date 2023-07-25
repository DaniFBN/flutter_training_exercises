import 'package:flutter/material.dart';
import 'package:mercado_livre_layout/app/themes/app_theme.dart';

import 'pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}
