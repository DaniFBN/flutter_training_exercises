import 'package:flutter_modular/flutter_modular.dart';

import '../../core/modules/user/stores/user_store.dart';
import 'pages/login_page.dart';

class LoginModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => LoginPage(
        userStore: Modular.get<UserStore>(),
      ),
    ),
  ];
}
