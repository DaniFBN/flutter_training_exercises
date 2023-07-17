import 'package:response/src/bank/utils/custom_print.dart';

import '../models/user_model.dart';
import '../utils/custom_input.dart';
import '../validators/confirm_password_validator.dart';
import '../validators/money_validator.dart';

void withdraw(UserModel user) {
  printWarning('Saldo atual: R\$ ${user.account.formattedBalance}');
  final value = customInput('Insira um valor para saque: ', moneyValidator);

  customInput(
    'Digite a senha: ',
    (value) => confirmPasswordValidator(value, user),
  );

  final money = double.parse(value);

  final result = user.account.withdraw(money);
  if (result) {
    printSuccess('Operação realiza com sucesso');
  } else {
    printError('Falha ao executar');
  }
}
