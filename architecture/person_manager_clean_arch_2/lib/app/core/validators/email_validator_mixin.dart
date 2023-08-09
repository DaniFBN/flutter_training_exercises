mixin EmailValidatorMixin {
  String? validateEmail(String email) {
    if (!email.contains('@')) {
      return 'Email inválido';
    }

    return null;
  }
}
