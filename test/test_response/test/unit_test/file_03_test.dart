import 'package:flutter_test/flutter_test.dart';
import 'package:test_response/unit_test/file_03.dart';

void main() {
  late Calculator sut;

  setUp(() {
    sut = Calculator();
  });

  test('file 03 sum ...', () {
    sut.sum(2);

    expect(sut.value, equals(2));
  });

  test('file 03 subtract ...', () {
    sut.subtract(2);

    expect(sut.value, equals(-2));
  });
}
