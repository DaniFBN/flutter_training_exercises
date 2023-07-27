String? monthValidator(String value) {
  final month = int.tryParse(value);

  if (month == null) return 'Deve ser um número';
  if (month < 1 && month > 24) return 'Deve ser entre 1 e 24';
  return null;
}
