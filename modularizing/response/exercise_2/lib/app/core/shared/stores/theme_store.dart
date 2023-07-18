import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ThemeState {
  dark,
  light;

  bool get isDark => this == dark;
}

class ThemeStore extends ValueNotifier<ThemeState> {
  ThemeStore() : super(ThemeState.dark);

  void toggle() {
    final newState = switch (value) {
      ThemeState.dark => ThemeState.light,
      ThemeState.light => ThemeState.dark,
    };

    value = newState;
  }
}
