import 'package:accessibility_response/app/widgets/menu_widget.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_accessibility.dart';

void main() {
  group('MenuWidget |', () {
    group('Accessibility |', () {
      testAccessibility(
        description: 'Android Tap Target - 48x48',
        widget: const MenuWidget(title: 'Title'),
        guideline: androidTapTargetGuideline,
      );
      testAccessibility(
        description: 'iOS Tap Target - 44x44',
        widget: const MenuWidget(title: 'Title'),
        guideline: iOSTapTargetGuideline,
      );
      testAccessibility(
        description: 'Text Contrast',
        widget: const MenuWidget(title: 'Title'),
        guideline: textContrastGuideline,
      );
      testAccessibility(
        description: 'Labeled Tap',
        widget: const MenuWidget(title: 'Title'),
        guideline: labeledTapTargetGuideline,
      );
    });
  });
}
