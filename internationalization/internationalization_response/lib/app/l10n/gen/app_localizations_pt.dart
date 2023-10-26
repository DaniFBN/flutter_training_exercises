import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcome => 'Bem vindo de volta, ';

  @override
  String get search => 'Pesquisar';

  @override
  String get routine => 'Rotina';

  @override
  String get seeAll => 'Veja todos';

  @override
  String get myTask => 'Minha task';

  @override
  String get toDo => 'A fazer';

  @override
  String get inProgress => 'Em progresso';

  @override
  String get done => 'Concluído';

  @override
  String get progress => 'Progresso';

  @override
  String taskAmount(num amount) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      other: '$amount tarefas',
      one: '1 tarefa',
      zero: 'Nenhuma',
    );
    return '$_temp0';
  }

  @override
  String dailyRoutine(String daily) {
    String _temp0 = intl.Intl.selectLogic(
      daily,
      {
        'm': 'Rotina Matinal',
        'a': 'Rotina da Tarde',
        'n': 'Rotina Noturna',
        'other': 'Rotina',
      },
    );
    return '$_temp0';
  }
}
