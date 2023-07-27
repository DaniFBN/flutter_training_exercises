import 'dart:io';

import 'custom_print.dart';

typedef Validator = String? Function(String value);

String customInput(String message, Validator validator) {
  late String value;
  late bool isValid;

  do {
    stdout.write(message);
    value = stdin.readLineSync()!.trim();

    final validatorMessage = validator(value);
    isValid = validatorMessage == null;

    if (validatorMessage != null) {
      printError(validatorMessage);
    }
  } while (!isValid);

  return value;
}
