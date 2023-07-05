import 'dart:io';

import '../models/user_model.dart';
import '../../utils/custom_print.dart';
import '../validators/value_validator.dart';
import 'helpers/password_input_validator.dart';

void deposit(UserModel user) {
  final value = customInput(
    message: 'Digite o valor a ser depositado: ',
    invalidMessage: 'O valor deve ser maior que 0',
    validator: valueValidator,
  );

  final valueToDeposit = double.parse(value);

  passwordInputValidator(user);

  user.account.deposit(valueToDeposit);
  stdout.writeln('Operação realizada com sucesso');
}
