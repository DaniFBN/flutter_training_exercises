bool noteValidator(String note) {
  final handled = int.parse(note);

  if (handled < 0 || handled > 10) return false;
  return true;
}
