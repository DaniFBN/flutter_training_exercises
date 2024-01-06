import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/routines_page.dart';
import 'pages/task_page.dart';
import 'themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/routines': (_) => const RoutinesPage(),
        '/tasks': (_) => const TaskPage(),
      },
    );
  }
}
