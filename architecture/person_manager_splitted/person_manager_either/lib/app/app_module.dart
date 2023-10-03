import 'package:flutter_modular/flutter_modular.dart';

import 'modules/person/person_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/person', module: PersonModule());
  }
}
