import 'package:accessibility_response/app/widgets/routine_card_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_accessibility.dart';

void main() {
  group('RoutineCardWidget |', () {
    group('Accessibility |', () {
      testAccessibility(
        description: 'Android Tap Target - 48x48',
        widget: const RoutineCardWidget(),
        guideline: androidTapTargetGuideline,
      );
      testAccessibility(
        description: 'iOS Tap Target - 44x44',
        widget: const RoutineCardWidget(),
        guideline: iOSTapTargetGuideline,
      );
      testAccessibility(
        description: 'Text Contrast',
        widget: const RoutineCardWidget(),
        guideline: textContrastGuideline,
      );
      testAccessibility(
        description: 'Labeled Tap',
        widget: const RoutineCardWidget(),
        guideline: labeledTapTargetGuideline,
      );
    });
  });
}
