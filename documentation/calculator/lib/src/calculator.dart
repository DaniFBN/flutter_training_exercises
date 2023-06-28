import 'dart:math' as math;

class Calculator {
  num sum(num value1, num value2) {
    return value1 + value2;
  }

  num subtract(num value1, num value2) {
    return value1 - value2;
  }

  num multiply(num value1, num value2) {
    return value1 / value2;
  }

  num divide(num value1, num value2) {
    return value1 / value2;
  }

  num divideRest(num value1, num value2) {
    return value1 % value2;
  }

  num squareRoot(num value1) {
    return math.sqrt(value1);
  }

  num pow(num value, num exponent) {
    return math.pow(value, exponent);
  }
}
