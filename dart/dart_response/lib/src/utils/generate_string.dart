import 'dart:math';

String generateString(int generateLength) {
  final random = Random();
  final values = List.generate(generateLength, (index) => random.nextInt(10));
  return values.join('');
}
