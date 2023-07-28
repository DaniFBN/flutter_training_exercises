import 'package:accessibility_response/app/widgets/percent_bar_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_accessibility.dart';

void main() {
  group('PercentBarWidget |', () {
    group('Accessibility |', () {
      testAccessibility(
        description: 'Android Tap Target - 48x48',
        widget: const PercentBarWidget(percentage: 0.5),
        guideline: androidTapTargetGuideline,
      );
      testAccessibility(
        description: 'iOS Tap Target - 44x44',
        widget: const PercentBarWidget(percentage: 0.5),
        guideline: iOSTapTargetGuideline,
      );
      testAccessibility(
        description: 'Text Contrast',
        widget: const PercentBarWidget(percentage: 0.5),
        guideline: textContrastGuideline,
      );
      testAccessibility(
        description: 'Labeled Tap',
        widget: const PercentBarWidget(percentage: 0.5),
        guideline: labeledTapTargetGuideline,
      );
    });
  });
}
