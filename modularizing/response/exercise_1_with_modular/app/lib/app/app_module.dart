import 'package:financial_module/financial_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rh_module/rh_module.dart';

import 'pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const HomePage()),
    ModuleRoute('/financial', module: FinancialModule()),
    ModuleRoute('/rh', module: RhModule()),
  ];
}
