import 'dart:io';

import 'package:response/src/weighted_average/validators/note_validator.dart';
import 'package:response/src/weighted_average/validators/weight_validator.dart';

import '../utils/custom_print.dart';

void weightedAverage() {
  final firstNote = customInput(
    message: 'Insira a primeira nota: ',
    invalidMessage: 'A nota deve ser maior que 0 e menor que 10',
    validator: noteValidator,
  );
  final firstWeight = customInput(
    message: 'Insira o peso da primeira nota: ',
    invalidMessage: 'A nota deve ser maior que 1 e menor que 3',
    validator: weightValidator,
  );

  final secondNote = customInput(
    message: 'Insira a segunda nota: ',
    invalidMessage: 'A nota deve ser maior que 0 e menor que 10',
    validator: noteValidator,
  );
  final secondWeight = customInput(
    message: 'Insira o peso da segunda nota: ',
    invalidMessage: 'A nota deve ser maior que 1 e menor que 3',
    validator: weightValidator,
  );

  final handledFirstNote = int.parse(firstNote);
  final handledFirstWeight = int.parse(firstWeight);
  final handledSecondNote = int.parse(secondNote);
  final handledSecondWeight = int.parse(secondWeight);

  final maxPoints = (handledFirstWeight + handledSecondWeight) * 10;
  stdout.writeln('Nota máxima: $maxPoints');

  final firstPoints = handledFirstNote * handledFirstWeight;
  final secondPoints = handledSecondNote * handledSecondWeight;
  final myPoints = firstPoints + secondPoints;
  stdout.writeln('Minha nota: $myPoints');

  final average = (myPoints / maxPoints) * 10;

  stdout.writeln('Média: $average');

  late String message;
  if (average >= 0 && average < 5) {
    message = 'Você tirou I';
  } else if (average >= 5 && average < 7) {
    message = 'Você tirou R';
  } else if (average >= 7 && average < 9.5) {
    message = 'Você tirou B';
  } else {
    message = 'Você tirou MB';
  }

  final String message2 = switch (average) {
    >= 0 && < 5 => 'Você tirou I',
    >= 5 && < 7 => 'Você tirou R',
    >= 7 && < 9.5 => 'Você tirou B',
    >= 9.5 && <= 10 => 'Você tirou MB',
    _ => 'Erro',
  };

  stdout.writeln(message);
  stdout.writeln(message2);
}
