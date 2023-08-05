import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/core/services/snack_bar/snack_bar_service.dart';

import 'core/services/snack_bar/i_snack_bar_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/');

    final snackBarService = Modular.get<ISnackBarService>() as SnackBarService;

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(), // Preto
        primaryTextTheme: const TextTheme(), // Branco
      ),
      scaffoldMessengerKey: snackBarService.key,
      routerConfig: Modular.routerConfig,
    );
  }
}
