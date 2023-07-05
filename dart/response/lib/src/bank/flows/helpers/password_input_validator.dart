import 'dart:io';

import '../../models/user_model.dart';

void passwordInputValidator(UserModel user) {
  late bool isValid;
  do {
    stdout.write('Digite a senha: ');
    final password = stdin.readLineSync()!;
    isValid = user.validatePassword(password);
    if (!isValid) {
      stdout.writeln('Senha incorreta');
    }
  } while (isValid != true);
}
