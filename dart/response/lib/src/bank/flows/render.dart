import 'dart:io';

import '../models/account/saving_account_model.dart';
import '../models/user_model.dart';
import '../../utils/custom_print.dart';
import '../validators/month_render_validator.dart';

void render(UserModel user) {
  final month = customInput(
    message: 'Digite a quantidade de meses que deseja simular',
    invalidMessage: 'Tem que sem entre 1 e 24 meses',
    validator: monthRenderValidator,
  );

  final monthToRender = int.parse(month);

  final account = user.account as SavingAccountModel;
  final result = account.renderSimulator(monthToRender);
  stdout.writeln(
    'Em $monthToRender mes(es) vai render R\$ ${result.toStringAsFixed(2)}',
  );
}
