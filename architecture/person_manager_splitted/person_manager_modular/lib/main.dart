import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/core/core_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CoreModule.initializeAsyncBinds();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
