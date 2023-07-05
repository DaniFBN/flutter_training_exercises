import 'dart:io';

String customInput({
  required String message,
  required String invalidMessage,
  required bool Function(String value) validator,
}) {
  late String value;
  late bool isValid;

  do {
    stdout.write(message);
    value = stdin.readLineSync()!.trim();

    isValid = validator(value);
    if (!isValid) {
      stdout.writeln(invalidMessage);
    }
  } while (!isValid);

  stdout.writeln('');

  return value;
}
