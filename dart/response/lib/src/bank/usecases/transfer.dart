import 'package:response/src/bank/models/current_account_model.dart';

import '../models/user_model.dart';
import '../utils/custom_input.dart';
import '../utils/custom_print.dart';
import '../validators/confirm_password_validator.dart';
import '../validators/money_validator.dart';
import '../validators/name_validator.dart';

void transfer(UserModel user) {
  final account = user.account as CurrentAccountModel;

  printWarning('Saldo atual: R\$ ${account.formattedBalance}');

  final value = customInput(
    'Insira um valor para transferir: ',
    moneyValidator,
  );
  final name = customInput(
    'Insira o nome do dono da conta para transferência: ',
    nameValidator,
  );

  customInput(
    'Digite a senha: ',
    (value) => confirmPasswordValidator(value, user),
  );

  final money = double.parse(value);

  final result = account.transfer(money, name);
  if (result) {
    printSuccess('Operação realiza com sucesso');
  } else {
    printError('Falha ao executar');
  }
}
