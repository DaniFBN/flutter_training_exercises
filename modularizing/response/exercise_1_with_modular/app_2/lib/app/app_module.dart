import 'package:financial_module_2/financial_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rh_module_2/rh_module.dart';

import 'pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const HomePage()),
    ModuleRoute(AppRoutes.financialRoute, module: FinancialModule()),
    ModuleRoute('/rh2', module: RhModule()),
  ];
}
