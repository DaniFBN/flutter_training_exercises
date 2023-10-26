import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => 'Welcome Back, ';

  @override
  String get search => 'Search';

  @override
  String get routine => 'Routine';

  @override
  String get seeAll => 'See All';

  @override
  String get myTask => 'My Task';

  @override
  String get toDo => 'To Do';

  @override
  String get inProgress => 'In progress';

  @override
  String get done => 'Done';

  @override
  String get progress => 'Progress';

  @override
  String taskAmount(num amount) {
    String _temp0 = intl.Intl.pluralLogic(
      amount,
      locale: localeName,
      other: '$amount tasks',
      one: '1 task',
      zero: 'Empty',
    );
    return '$_temp0';
  }

  @override
  String dailyRoutine(String daily) {
    String _temp0 = intl.Intl.selectLogic(
      daily,
      {
        'm': 'Morning Routine',
        'a': 'Afternoon Routine',
        'n': 'Night Routine',
        'other': 'Routine',
      },
    );
    return '$_temp0';
  }
}
