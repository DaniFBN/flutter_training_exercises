import 'dart:io';

import 'package:flutter/material.dart';

class AppFailure implements Exception {
  final String message;
  final StackTrace stackTrace;

  AppFailure(this.message, {StackTrace? stackTrace})
      : stackTrace = stackTrace ?? StackTrace.current {
    final isTest = Platform.environment.containsKey('FLUTTER_TEST');
    if (isTest) return;

    debugPrintStack(stackTrace: stackTrace);

    // Crashlytics
  }

  @override
  String toString() => message;
}
