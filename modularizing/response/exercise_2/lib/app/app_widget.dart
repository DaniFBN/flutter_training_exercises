import 'package:exercise_2/app/core/shared/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/login/');
    Modular.setNavigatorKey(NavigatorService.navigatorKey);

    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      highContrastTheme: ThemeData(
        scaffoldBackgroundColor: Colors.red,
        useMaterial3: true,
      ),
      highContrastDarkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
        useMaterial3: true,
      ),
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
