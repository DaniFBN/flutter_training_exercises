import 'package:flutter_modular/flutter_modular.dart';

import 'pages/rh_detail_page.dart';
import 'pages/rh_page.dart';

class RhModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const RhPage()),
    ChildRoute('/detail', child: (_, __) => const RhDetailPage()),
  ];
}
