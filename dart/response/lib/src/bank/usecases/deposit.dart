import 'package:response/src/bank/utils/custom_print.dart';

import '../models/user_model.dart';
import '../utils/custom_input.dart';
import '../validators/confirm_password_validator.dart';
import '../validators/money_validator.dart';

void deposit(UserModel user) {
  final value = customInput('Insira um valor para deposito: ', moneyValidator);

  customInput(
    'Digite a senha: ',
    (value) => confirmPasswordValidator(value, user),
  );

  final money = double.parse(value);

  user.account.deposit(money);

  printSuccess('Operação realiza com sucesso');
}
