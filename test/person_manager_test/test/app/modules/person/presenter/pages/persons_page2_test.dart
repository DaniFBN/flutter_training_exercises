import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/state/persons_state.dart';
import 'package:person_manager_test/app/modules/person/presenter/pages/persons_page.dart';

import '../../../../mocks.dart';
import '../../mocks.dart';

void main() {
  final cubit = PersonsCubitMock();

  setUp(() {
    when(cubit.get).thenAnswer((_) async {
      return;
    });
  });

  tearDown(() => reset(cubit));

  group('PersonsPage', () {
    testWidgets(
      'Deve exibir um CircularProgressIndicator quando o cubit estiver carregando',
      (tester) async {
        when(cubit.get).thenAnswer((_) async {
          return;
        });

        whenListen(
          cubit,
          Stream.value(const LoadingPersonsState()),
          initialState: const LoadingPersonsState(),
        );

        await tester.pumpWidget(
          MaterialApp(home: PersonsPage(cubit: cubit)),
        );

        final appBarTextFinder = find.text('Persons');
        final circularFinder = find.byType(CircularProgressIndicator);

        expect(appBarTextFinder, findsOneWidget);
        expect(circularFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Deve exibir um texto centralizado quando o cubit estiver com erro',
      (tester) async {
        final failure = AppFailureMock();
        when(() => failure.message).thenReturn('MOCK');
        whenListen(
          cubit,
          Stream.value(FailurePersonsState(failure)),
          initialState: FailurePersonsState(failure),
        );

        await tester.pumpWidget(
          MaterialApp(home: PersonsPage(cubit: cubit)),
        );

        final errorTextFinder = find.byWidgetPredicate((widget) {
          if (widget is Center) {
            final child = widget.child;

            return child is Text && child.data == 'MOCK';
          }

          return false;
        });

        expect(errorTextFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Deve exibir uma lista com as pessoas quando o cubit tiver informação',
      (tester) async {
        final person = PersonEntityMock();
        when(() => person.name).thenReturn('Daniel Fernandes');
        when(() => person.email).thenReturn('daniel.noronha@fteam.dev');
        whenListen(
          cubit,
          Stream.value(DataPersonsState([person])),
          initialState: DataPersonsState([person]),
        );

        await tester.pumpWidget(
          MaterialApp(home: PersonsPage(cubit: cubit)),
        );

        final nameFinder = find.widgetWithText(ListTile, 'Daniel Fernandes');
        final emailFinder =
            find.widgetWithText(ListTile, 'daniel.noronha@fteam.dev');

        expect(nameFinder, findsOneWidget);
        expect(emailFinder, findsOneWidget);
      },
    );
  });
}
