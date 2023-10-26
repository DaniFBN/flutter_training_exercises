import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/persons_cubit.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/state/persons_state.dart';
import 'package:person_manager_test/app/modules/person/presenter/pages/persons_page.dart';
import 'package:person_manager_test/app/modules/person/presenter/pages/widgets/custom_progress_indicator.dart';

import '../../../../mocks.dart';
import '../../mocks.dart';

void main() {
  late PersonsCubit cubit;

  setUp(() {
    cubit = PersonsCubitMock();

    when(cubit.get).thenAnswer((_) async {
      return;
    });
  });

  group('PersonsPage |', () {
    testWidgets(
      'Deve exibir um CustomProgressIndicator quando o cubit estiver carregando',
      (tester) async {
        // Arrange
        when(() => cubit.state).thenReturn(const LoadingPersonsState());

        await tester.pumpWidget(MaterialApp(home: PersonsPage(cubit: cubit)));

        // Assert
        final circularProgressFinder = find.byType(CircularProgressIndicator);
        expect(circularProgressFinder, findsOneWidget);

        final customProgressFinder = find.byType(CustomProgressIndicator);
        expect(customProgressFinder, findsOneWidget);

        final centralizedProgressFinder = find.byWidgetPredicate((widget) {
          return widget is Center && widget.child is CustomProgressIndicator;
        });
        expect(centralizedProgressFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Deve exibir a mensagem de erro centralizada quando o cubit estiver com algum erro',
      (tester) async {
        // Arrange
        final failure = AppFailureMock();

        when(() => failure.message).thenReturn('MOCK-FAILURE');
        when(() => cubit.state).thenReturn(FailurePersonsState(failure));

        await tester.pumpWidget(MaterialApp(home: PersonsPage(cubit: cubit)));

        // Assert
        final failureTextFinder = find.text('MOCK-FAILURE');
        expect(failureTextFinder, findsOneWidget);

        final centralizedTextFinder = find.byWidgetPredicate((widget) {
          if (widget is Center) {
            final child = widget.child;
            return child is Text && child.data == 'MOCK-FAILURE';
          }

          return false;
        });
        expect(centralizedTextFinder, findsOneWidget);

        final textKeyFinder = find.byKey(const ValueKey('FAILURE-MESSAGE'));
        expect(textKeyFinder, findsOneWidget);
      },
    );

    testWidgets(
      'Deve exibir uma lista com as pessoas quando o estado tiver informação',
      (tester) async {
        // Arrange
        final person = PersonEntityMock();

        when(() => person.name).thenReturn('Daniel Fernandes');
        when(() => person.email).thenReturn('daniel.noronha@fteam.dev');
        when(() => cubit.state).thenReturn(DataPersonsState([person]));

        await tester.pumpWidget(MaterialApp(home: PersonsPage(cubit: cubit)));

        // Assert
        final listFinder = find.byType(ListView);
        expect(listFinder, findsOneWidget);

        final listTileFinder = find.byType(ListTile);
        expect(listTileFinder, findsOneWidget);

        final nameFinder = find.widgetWithText(ListTile, 'Daniel Fernandes');
        expect(nameFinder, findsOneWidget);

        final emailFinder = find.widgetWithText(
          ListTile,
          'daniel.noronha@fteam.dev',
        );
        expect(emailFinder, findsOneWidget);
      },
    );
  });
}
