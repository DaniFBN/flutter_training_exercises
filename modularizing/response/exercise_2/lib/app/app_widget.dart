import 'package:exercise_2/app/core/modules/user/stores/user_store.dart';
import 'package:exercise_2/app/core/shared/services/navigator_service.dart';
import 'package:exercise_2/app/core/shared/stores/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final themeStore = Modular.get<ThemeStore>();
  final userStore = Modular.get<UserStore>();

  @override
  void initState() {
    super.initState();

    Modular.setInitialRoute('/login/');
    Modular.setNavigatorKey(NavigatorService.navigatorKey);

    // userStore.addListener(logoutListener);
  }

  // void logoutListener() {
  //   if (!userStore.isLogged) {
  //     Modular.to.navigate('/login/');
  //   }
  // }

  @override
  void dispose() {
    // userStore.removeListener(logoutListener);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStore,
      builder: (_, state, __) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
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
      },
    );
  }
}
