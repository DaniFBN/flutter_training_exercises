import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/user/stores/user_store.dart';

class Page1Guard extends RouteGuard {
  Page1Guard() : super(redirectTo: '/login/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final userStore = Modular.get<UserStore>();

    final user = userStore.value;
    if (user == null) return false;

    final condition = user.permissions.contains(UserPermission.page1);

    if (condition) {
      log('Liberado pelo Guard');
    } else {
      log('Protegido pelo Guard');
    }

    return condition;
  }
}
