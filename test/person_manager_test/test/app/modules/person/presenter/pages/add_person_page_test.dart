import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/state/add_person_state.dart';
import 'package:person_manager_test/app/modules/person/presenter/pages/add_person_page.dart';

import '../../mocks.dart';

void main() {
  final formCubit = AddPersonCubitMock();
  final listCubit = PersonsCubitMock();

  setUpAll(() {
    registerFallbackValue(CreatePersonParamFake());
  });

  tearDown(() {
    reset(formCubit);
    reset(listCubit);
  });

  testWidgets('add person page ...', (tester) async {
    when(() => formCubit.state).thenReturn(const InitialAddPersonState());
    when(() => formCubit.create(any())).thenAnswer((_) async {
      return;
    });

    await tester.pumpWidget(
      MaterialApp(
        home: AddPersonPage(cubit: formCubit, personsCubit: listCubit),
      ),
    );

    final dateFieldFinder = find.byWidgetPredicate((widget) {
      return widget is TextField &&
          widget.decoration?.labelText == 'Data de nascimento';
    });
    expect(dateFieldFinder, findsOneWidget);
    await tester.enterText(dateFieldFinder, '1999-09-09');

    final submitButtonFinder = find.byType(ElevatedButton);
    await tester.tap(submitButtonFinder);

    verify(() => formCubit.create(any())).called(1);
  });
}
