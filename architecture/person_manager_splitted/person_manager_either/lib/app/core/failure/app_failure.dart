import 'dart:io';

import 'package:flutter/foundation.dart';

class AppFailure implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final String? label;

  AppFailure(
    this.message, {
    StackTrace? stackTrace,
    this.label,
  }) : stackTrace = stackTrace ?? StackTrace.current {
    final isTest = Platform.environment.containsKey('FLUTTER_TEST');
    if (isTest) return;

    debugPrintStack(stackTrace: stackTrace);

    // Crashlytics
  }

  @override
  String toString() => message;
}
