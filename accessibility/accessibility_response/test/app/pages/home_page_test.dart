import 'package:accessibility_response/app/pages/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_accessibility.dart';

void main() {
  group('HomePage |', () {
    group('Accessibility |', () {
      testAccessibility(
        description: 'Android Tap Target - 48x48',
        widget: const HomePage(),
        guideline: androidTapTargetGuideline,
      );
      testAccessibility(
        description: 'iOS Tap Target - 44x44',
        widget: const HomePage(),
        guideline: iOSTapTargetGuideline,
      );
      testAccessibility(
        description: 'Text Contrast',
        widget: const HomePage(),
        guideline: textContrastGuideline,
      );
      testAccessibility(
        description: 'Labeled Tap',
        widget: const HomePage(),
        guideline: labeledTapTargetGuideline,
      );
    });
  });
}
