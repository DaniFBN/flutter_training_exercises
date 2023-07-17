// ignore_for_file: unused_import

import 'dart:io';

import 'package:response/src/bank/menu/interactive_menu.dart';

import '../utils/clean_terminal.dart';
import '../utils/generate_string.dart';
import 'models/account_model.dart';
import 'models/current_account_model.dart';
import 'models/saving_account_model.dart';
import 'models/user_model.dart';
import 'usecases/show_info.dart';
import 'utils/custom_input.dart';
import 'utils/custom_print.dart';
import 'validators/account_type_validator.dart';
import 'validators/name_validator.dart';
import 'validators/password_validator.dart';

Future<void> bank() async {
  cleanTerminal();

  stdout.writeln('Bem-vindo ao Banco K\n');

  final name = customInput('Digite seu nome: ', nameValidator);
  final password = customInput('Digite sua senha: ', passwordValidator);
  final accountType = customInput(
    'Escolha o tipo da sua conta:\n0 - Conta poupança\n1 - Conta corrente\nDigite o número da opção: ',
    accountTypeValidator,
  );

  final bool isCurrentAccount = accountType == '1';
  late final AccountModel account;
  if (isCurrentAccount) {
    account = CurrentAccountModel(
      balance: 0,
      accountNumber: generateString(8),
      agencyNumber: generateString(5),
      historic: [],
    );
  } else {
    account = SavingAccountModel(
      balance: 10000,
      accountNumber: generateString(8),
      agencyNumber: generateString(5),
      historic: [],
    );
  }

  final user = UserModel(
    name: name,
    account: account,
    password: password,
  );

  cleanTerminal();

  printSuccess('Conta criada com sucesso');
  showInfo(user);

  await Future.delayed(Duration(seconds: 2));
  cleanTerminal();

  await interactiveMenu(user);
}
