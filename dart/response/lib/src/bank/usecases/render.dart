import '../models/saving_account_model.dart';
import '../models/user_model.dart';
import '../utils/custom_input.dart';
import '../utils/custom_print.dart';
import '../validators/confirm_password_validator.dart';
import '../validators/month_validator.dart';

void render(UserModel user) {
  final account = user.account as SavingAccountModel;

  printWarning('Saldo atual: R\$ ${account.formattedBalance}');

  final value = customInput(
    'Insira quantos meses você deseja estimar: ',
    monthValidator,
  );

  customInput(
    'Digite a senha: ',
    (value) => confirmPasswordValidator(value, user),
  );

  final month = int.parse(value);

  final result = account.renderSimulate(month);
  final fee = result.fee;
  final yield2 = result.yield2.toStringAsFixed(2);
  final balance = result.balance.toStringAsFixed(2);
  
  printSuccess('Taxa de $fee% ao mês');
  printSuccess('Rendeu R\$ $yield2');
  printSuccess('Em $month mes(es) você teria R\$ $balance');
}
