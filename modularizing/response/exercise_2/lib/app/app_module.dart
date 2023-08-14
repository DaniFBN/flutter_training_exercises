import 'package:flutter_modular/flutter_modular.dart';

import 'core/modules/user/user_module.dart';
import 'core/shared/guards/logged_guard.dart';
import 'core/shared/guards/page1_guard.dart';
import 'core/shared/stores/theme_store.dart';
import 'modules/home/home_module.dart';
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
    ModuleRoute(
      '/',
      module: HomeModule(),
      guards: [LoggedGuard(), Page1Guard()],
    ),
  ];
}
