String? moneyValidator(String value) {
  final money = double.tryParse(value);

  if (money == null) return 'Digite somente números';
  if (money <= 0) return r'O valor deve ser maior do que R$ 0,00';
  return null;
}
