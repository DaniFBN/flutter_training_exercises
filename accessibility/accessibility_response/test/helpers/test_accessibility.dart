import 'package:accessibility_response/app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';

import 'mock_image.dart';

@isTest
void testAccessibility({
  required String description,
  required Widget widget,
  required AccessibilityGuideline guideline,
}) {
  testWidgets(description, (tester) async {
    final semanticsHandle = tester.ensureSemantics();

    final materialApp = MaterialApp(
      theme: AppTheme.lightTheme,
      home: Material(child: widget),
    );

    await mockImage(() async => await tester.pumpWidget(materialApp));

    await expectLater(tester, meetsGuideline(guideline));
    semanticsHandle.dispose();
  });
}
