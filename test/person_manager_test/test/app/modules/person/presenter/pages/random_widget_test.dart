import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:person_manager_test/app/modules/person/presenter/pages/random_widget.dart';

void main() {
  testWidgets(
    'random widget ...',
    (tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RandomWidget(),
      ));

      final textFinder = find.text('Tanto faz');
      final textSemanticsFinder = find.bySemanticsLabel('Whatever');
      final textTypeFinder = find.byType(Text);
      final textKeyFinder = find.byKey(const ValueKey('tanto-faz'));
      final textPredicateFinder = find.byWidgetPredicate((widget) {
        return widget is Text &&
            widget.data == 'Tanto faz' &&
            widget.key == const ValueKey('tanto-faz') &&
            widget.semanticsLabel == 'Whatever';
      });

      expect(textFinder, findsNWidgets(2));
      expect(textSemanticsFinder, findsOneWidget);
      expect(textTypeFinder, findsNWidgets(2));
      expect(textKeyFinder, findsOneWidget);
      expect(textPredicateFinder, findsOneWidget);
    },
  );
}
