import 'dart:math' as math;

/// [Calculator] é uma classe que contém operações matemáticas
class Calculator {

  /// Construtor para criar uma calculadora
  const Calculator();


  /// Deve somar 2 valores.  
  /// 
  /// Ambos valores([value1] e [value2]) são [num], então tanto [int] como 
  /// [double] são aceitos
  num sum(num value1, num value2) {
    return value1 + value2;
  }

  /// Deve subtrair 2 valores.
  /// 
  /// Ambos valores([value1] e [value2]) são [num], então tanto [int] como 
  /// [double] são aceitos
  num subtract(num value1, num value2) {
    return value1 - value2;
  }

  /// Deve multiplicar 2 valores.  
  /// 
  /// Ambos valores([value1] e [value2]) são [num], então tanto [int] como 
  /// [double] são aceitos.
  num multiply(num value1, num value2) {
    return value1 * value2;
  }

  /// Deve dividir 2 valores.  
  /// 
  /// Ambos valores([value1] e [value2]) são [num], então tanto [int] como 
  /// [double] são aceitos.
  /// 
  /// - [value1] é o dividendo.
  /// - [value2] é o divisor.
  /// 
  /// Caso [value2] seja 0, o resultado será `Infinity`
  num divide(num value1, num value2) {
    return value1 / value2;
  }

  /// Deve retornar o resto da divisão de 2 valores
  /// - [value2] é o dividendo.
  /// - [value1] é o divisor.
  num divideRest(num value1, num value2) {
    return value2 % value1;
  }

  /// Deve retornar a raiz quadrada do [value1]
  num squareRoot(num value1) {
    return math.sqrt(value1);
  }

  /// Deve retornar a exponenciação do [value], sendo [value2] o expoente
  num pow(num value, num value2) {
    return math.pow(value, value2);
  }
}

