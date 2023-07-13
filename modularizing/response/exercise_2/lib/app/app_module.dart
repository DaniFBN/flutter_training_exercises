import 'package:exercise_2/app/core/modules/user/user_module.dart';
import 'package:exercise_2/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    UserModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/', module: HomeModule()),
  ];
}
