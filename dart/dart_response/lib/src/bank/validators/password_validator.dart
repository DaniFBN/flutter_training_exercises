String? passwordValidator(String value) {
  final regex = RegExp(r'^[0-9]{1}$');
  if (regex.hasMatch(value)) return null;

  return 'A senha deve conter 8 números';
}
