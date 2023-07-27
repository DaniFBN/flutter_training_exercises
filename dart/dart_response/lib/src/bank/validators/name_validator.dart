String? nameValidator(String value) {
  if (!value.contains(' ')) return 'Deve o conter o nome e sobrenome';

  return null;
}
