import 'package:exercise_2/app/core/modules/user/user_module.dart';
import 'package:exercise_2/app/modules/home/home_module.dart';
import 'package:exercise_2/app/core/shared/stores/theme_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    UserModule(),
  ];

  @override
  List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => ThemeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/', module: HomeModule()),
  ];
}
