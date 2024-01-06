import 'package:flutter_test/flutter_test.dart';
import 'package:test_response/unit_test/file_02.dart';

void main() {
  test('file 02 ...', () {
    expect(file02, throwsA(isA<SpecificException>()));
  });
}
