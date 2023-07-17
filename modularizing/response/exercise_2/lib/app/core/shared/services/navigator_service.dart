import 'package:flutter/material.dart';

class NavigatorService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void pushNamed(String route) {
    navigatorKey.currentState!.pushNamed(route);
    // Modular.to.pushNamed(route);
  }

  static void pushReplacementNamed(String route, {Object? arguments}) {
    // Modular.to.pushReplacementNamed(route, arguments: arguments);

    navigatorKey.currentState!.pushReplacementNamed(
      route,
      arguments: arguments,
    );
  }
}