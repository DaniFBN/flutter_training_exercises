import 'dart:io';

import 'package:response/src/bank/usecases/withdraw.dart';

import '../../utils/clean_terminal.dart';
import '../models/current_account_model.dart';
import '../models/user_model.dart';
import '../usecases/account_statement.dart';
import '../usecases/deposit.dart';
import '../usecases/render.dart';
import '../usecases/show_info.dart';
import '../usecases/transfer.dart';

Future<void> interactiveMenu(UserModel user) async {
  bool confirmExit = false;

  do {
    final isCurrentAccount = user.account is CurrentAccountModel;

    final menu = _menu(
      userName: user.name,
      isCurrentAccount: isCurrentAccount,
    );
    stdout.write(menu);

    final menuOption = stdin.readLineSync()!;

    cleanTerminal();

    switch (menuOption) {
      case '1':
        deposit(user);
      case '2':
        withdraw(user);
      case '3':
        showInfo(user);
      case '4':
        accountStatement(user);
      case '5':
        if (isCurrentAccount) {
          transfer(user);
        } else {
          render(user);
        }
      case '0':
        stdout.write('Tem certeza que deseja sair? (s/n) ');

        final exit = stdin.readLineSync()!;
        confirmExit = exit == 's';
    }

    await Future.delayed(Duration(seconds: 5));
    cleanTerminal();
  } while (!confirmExit);
}

String _menu({
  required String userName,
  required bool isCurrentAccount,
}) {
  return '''
Bem-vindo $userName!

1 - Depositar
2 - Sacar
3 - Exibir informações
4 - Extrato
5 - ${isCurrentAccount ? 'Transferir' : 'Consultar prévia rendimento'}
0 - Sair

Digite a opção desejada: ''';
}
