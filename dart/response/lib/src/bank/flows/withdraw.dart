import 'dart:io';

import '../models/user_model.dart';
import '../../utils/custom_print.dart';
import '../validators/value_validator.dart';
import 'helpers/password_input_validator.dart';

void withdraw(UserModel user) {
  final value = customInput(
    message: 'Digite o valor a ser sacado: ',
    invalidMessage: 'O valor deve ser maior que 0',
    validator: valueValidator,
  );

  final valueToWithdraw = double.parse(value);

  passwordInputValidator(user);

  final result = user.account.withdraw(valueToWithdraw);
  if (result) {
    stdout.writeln('Operação realizada com sucesso');
  } else {
    stdout.writeln('Operação cancelada, o valor é maior que o saldo');
  }
}
