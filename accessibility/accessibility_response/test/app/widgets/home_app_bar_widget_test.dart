import 'package:accessibility_response/app/widgets/home_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_accessibility.dart';

void main() {
  group('HomeAppBarWidget |', () {
    group('Accessibility |', () {
      testAccessibility(
        description: 'Android Tap Target - 48x48',
        widget: const Scaffold(appBar: HomeAppBarWidget()),
        guideline: androidTapTargetGuideline,
      );
      testAccessibility(
        description: 'iOS Tap Target - 44x44',
        widget: const Scaffold(appBar: HomeAppBarWidget()),
        guideline: iOSTapTargetGuideline,
      );
      testAccessibility(
        description: 'Text Contrast',
        widget: const Scaffold(appBar: HomeAppBarWidget()),
        guideline: textContrastGuideline,
      );
      testAccessibility(
        description: 'Labeled Tap',
        widget: const Scaffold(appBar: HomeAppBarWidget()),
        guideline: labeledTapTargetGuideline,
      );
    });
  });
}
