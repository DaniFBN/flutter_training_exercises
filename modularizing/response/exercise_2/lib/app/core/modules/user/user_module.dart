import 'package:flutter_modular/flutter_modular.dart';

import 'stores/user_store.dart';

class UserModule extends Module {
  @override
  List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => UserStore(), export: true),
  ];
}
