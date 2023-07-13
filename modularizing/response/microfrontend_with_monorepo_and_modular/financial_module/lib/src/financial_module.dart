import 'package:flutter_modular/flutter_modular.dart';

import 'pages/financial_page.dart';

class FinancialModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const FinancialPage()),
  ];
}
