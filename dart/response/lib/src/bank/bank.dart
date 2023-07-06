import 'dart:io';

import 'flows/deposit.dart';
import 'flows/render.dart';
import 'flows/transfer.dart';
import 'flows/withdraw.dart';
import 'models/account/account_model.dart';
import 'models/account/current_account_model.dart';
import 'models/account/saving_account_model.dart';
import 'models/user_model.dart';
import '../utils/custom_print.dart';
import '../utils/generate_string.dart';
import 'validators/account_type_validator.dart';
import 'validators/name_validator.dart';
import 'validators/password_validator.dart';

void bank() {
  final name = customInput(
    message: 'Insira seu nome: ',
    invalidMessage: 'O nome é obrigatório',
    validator: nameValidator,
  );
  final password = customInput(
    message: 'Insira sua senha: ',
    invalidMessage: 'A senha deve conter 8 números',
    validator: passwordValidator,
  );
  final accountType = customInput(
    message: 'C - Conta Corrente\nP - Conta Poupança\nInsira o tipo de conta: ',
    invalidMessage: 'Deve ser C para Corrente ou P para Poupança',
    validator: accountTypeValidator,
  );

  late AccountModel account;

  final isCurrentAccount = accountType == 'c';
  if (isCurrentAccount) {
    account = CurrentAccountModel(
      accountNumber: generateString(8),
      agencyNumber: generateString(5),
      balance: 0,
      historic: [],
    );
  } else {
    account = SavingAccountModel(
      accountNumber: generateString(8),
      agencyNumber: generateString(5),
      balance: 0,
      historic: [],
    );
  }

  final user = UserModel(name: name, password: password, account: account);
  stdout.writeln('Nome na conta: ${user.name}');
  stdout.writeln('Número da conta: ${account.accountNumber}');
  stdout.writeln('Agência: ${account.agencyNumber}');

  late MenuOption? option;
  bool confirmExit = false;
  do {
    stdout.writeln(isCurrentAccount ? menuCurrentMessage : menuSavingMessage);
    final optionCode = stdin.readLineSync()!;
    option = MenuOption.fromCode(optionCode);
    if (option == null) continue;

    switch (option) {
      case MenuOption.deposit:
        deposit(user);
      case MenuOption.withdraw:
        withdraw(user);
      case MenuOption.data:
        stdout.writeln('Nome na conta: ${user.name}');
        stdout.writeln('Número da conta: ${account.accountNumber}');
        stdout.writeln('Agência: ${account.agencyNumber}');
        stdout.writeln('Saldo: R\$ ${account.balance}');
      case MenuOption.historic:
        final message = user.account.historic.map((e) => e.data).join('\n');
        stdout.writeln(message);
      case MenuOption.custom:
        if (isCurrentAccount) {
          transfer(user);
        } else {
          render(user);
        }
      case MenuOption.exit:
        stdout.writeln('Tem certeza que deseja sair? (s/n)');
        final confirmExitValue = stdin.readLineSync()!;
        confirmExit = confirmExitValue == 's';
    }
  } while (option != MenuOption.exit && confirmExit != true);
}

enum MenuOption {
  deposit('1'),
  withdraw('2'),
  data('3'),
  historic('4'),
  custom('5'),
  exit('0');

  const MenuOption(this.code);
  final String code;

  static MenuOption? fromCode(String code) {
    final options = values.where((e) => e.code == code);
    if (options.isEmpty) return null;
    return options.first;
  }
}

final menuCurrentMessage = '''
Bem vindo ao Menu

1 - Depositar
2 - Sacar
3 - Ver informações da conta
4 - Histórico de atividades
5 - Transferir
0 - Sair 
''';

final menuSavingMessage = '''
Bem vindo ao Menu

1 - Depositar
2 - Sacar
3 - Ver informações da conta
4 - Histórico de atividades
5 - Consultar rendimento
0 - Sair
''';
