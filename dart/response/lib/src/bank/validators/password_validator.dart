bool passwordValidator(String value) {
  final regex = RegExp(r'^[0-9]{8}$');
  final isValid = regex.hasMatch(value);

  return isValid;
}
