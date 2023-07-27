String? accountTypeValidator(String value) {
  if (value == '0' || value == '1') return null;

  return '$value é uma opção inválida. Digite 0 ou 1.';
}
