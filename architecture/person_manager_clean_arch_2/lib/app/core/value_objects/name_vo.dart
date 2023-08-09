import '_value_object.dart';

final class NameVO extends ValueObject<String> {
  NameVO(super.value);

  @override
  void validate() {
    final regex = RegExp(r'[@#$%&*^!]');
    if (regex.hasMatch(value)) {
      setError('O nome não deve ter caracteres especiais');
    }
    if (value.trim().length < 3) {
      setError('O nome deve ter 3 letras');
    }
  }
}
