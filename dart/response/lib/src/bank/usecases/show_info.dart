import 'dart:io';

import '../models/current_account_model.dart';
import '../models/user_model.dart';

void showInfo(UserModel user) {
  final isCurrentAccount = user.account is CurrentAccountModel;

  stdout.writeln('Nome na conta: ${user.name}');
  stdout.writeln(
    'Tipo da conta: ${isCurrentAccount ? 'Corrente' : 'Poupança'}',
  );
  stdout.writeln('Número da conta: ${user.account.accountNumber}');
  stdout.writeln('Agência: ${user.account.agencyNumber}');
  stdout.writeln('Saldo: R\$ ${user.account.formattedBalance}');
}
