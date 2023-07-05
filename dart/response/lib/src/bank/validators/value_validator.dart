bool valueValidator(String value) {
  final handledValue = double.tryParse(value);

  if (handledValue == null) return false;
  if (handledValue < 0) return false;
  return true;
}
