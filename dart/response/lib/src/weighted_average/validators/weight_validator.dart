bool weightValidator(String weight) {
  final handled = int.parse(weight);

  if (handled < 1 || handled > 3) return false;
  return true;
}
