import 'package:flutter_modular/flutter_modular.dart';

import 'pages/person_page.dart';

class PersonModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const PersonPage()),
  ];
}


