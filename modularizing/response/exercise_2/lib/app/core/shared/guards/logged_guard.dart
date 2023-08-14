import 'dart:async';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/user/stores/user_store.dart';

class LoggedGuard extends RouteGuard {
  LoggedGuard() : super(redirectTo: '/login/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) {
    final userStore = Modular.get<UserStore>();
    final condition = userStore.isLogged;

    if (condition) {
      log('Liberado pelo Guard');
    } else {
      log('Protegido pelo Guard');
    }

    return condition;
  }
}
