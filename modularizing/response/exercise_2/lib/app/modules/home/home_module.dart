import 'package:flutter_modular/flutter_modular.dart';

import '../../core/modules/user/stores/user_store.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => HomePage(
        email: args.data ?? 'Error',
        userStore: Modular.get<UserStore>(),
      ),
    ),
  ];
}
