import 'dart:io';

import '../models/account/current_account_model.dart';
import '../models/user_model.dart';
import '../../utils/custom_print.dart';
import '../validators/name_validator.dart';
import '../validators/value_validator.dart';
import 'helpers/password_input_validator.dart';

void transfer(UserModel user) {
  final userName = customInput(
    message: 'Transferir para: ',
    invalidMessage: 'O nome é obrigatório',
    validator: nameValidator,
  );

  final value = customInput(
    message: 'Digite o valor a ser transferido: ',
    invalidMessage: 'O valor deve ser maior que 0',
    validator: valueValidator,
  );
  final valueToTransfer = double.parse(value);

  passwordInputValidator(user);

  final account = user.account as CurrentAccountModel;
  final result = account.transfer(value: valueToTransfer, userName: userName);
  if (result) {
    stdout.writeln('Operação realizada com sucesso');
  } else {
    stdout.writeln('Operação cancelada, o valor é maior que o saldo');
  }
}
