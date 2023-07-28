import 'package:accessibility_response/app/widgets/card_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/custom_material_app.dart';

void main() {
  group('CardGroupWidget |', () {
    group('Accessibility |', () {
      testWidgets('Android Tap Target - 48x48', (tester) async {
        final semanticsHandle = tester.ensureSemantics();
        await tester.pumpWidget(customMaterialApp(
          const CardGroupWidget(
            icon: Icons.add,
            subtitle: 'Subtitle',
            title: 'Title',
          ),
        ));

        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        semanticsHandle.dispose();
      });

      testWidgets('iOS Tap Target - 44x44', (tester) async {
        final semanticsHandle = tester.ensureSemantics();
        await tester.pumpWidget(customMaterialApp(
          const CardGroupWidget(
            icon: Icons.add,
            subtitle: 'Subtitle',
            title: 'Title',
          ),
        ));

        await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
        semanticsHandle.dispose();
      });

      testWidgets('Text Contrast', (tester) async {
        final semanticsHandle = tester.ensureSemantics();
        await tester.pumpWidget(customMaterialApp(
          const CardGroupWidget(
            icon: Icons.add,
            subtitle: 'Subtitle',
            title: 'Title',
          ),
        ));

        await expectLater(tester, meetsGuideline(textContrastGuideline));
        semanticsHandle.dispose();
      });

      testWidgets('Labeled Tap', (tester) async {
        final semanticsHandle = tester.ensureSemantics();
        await tester.pumpWidget(customMaterialApp(
          const CardGroupWidget(
            icon: Icons.add,
            subtitle: 'Subtitle',
            title: 'Title',
          ),
        ));

        await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
        semanticsHandle.dispose();
      });
    });
  });
}
