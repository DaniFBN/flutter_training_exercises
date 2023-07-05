bool accountTypeValidator(String value) {
  final handledValue = value.toLowerCase();
  if (handledValue != 'p' && handledValue != 'c') return false;
  return true;
}
