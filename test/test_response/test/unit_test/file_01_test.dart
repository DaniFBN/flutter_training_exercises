import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_response/unit_test/file_01.dart';

void main() {
  test('file 01 ...', () {
    final result = file01(1, 1);

    expect(result, equals(2));
  });
}
