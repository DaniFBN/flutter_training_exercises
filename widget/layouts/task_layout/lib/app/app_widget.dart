import 'package:flutter/material.dart';
import 'package:task_layout/app/pages/home_page.dart';
import 'package:task_layout/app/pages/routines_page.dart';
import 'package:task_layout/app/pages/task_page.dart';
import 'package:task_layout/app/themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      showSemanticsDebugger: true,
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/routines': (_) => const RoutinesPage(),
        '/tasks': (_) => const TaskPage(),
      },
    );
  }
}
