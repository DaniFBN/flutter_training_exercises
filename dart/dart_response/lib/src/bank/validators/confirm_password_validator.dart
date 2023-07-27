import '../models/user_model.dart';

String? confirmPasswordValidator(String value, UserModel user) {
  final isValid = user.confirmPassword(value);

  if (isValid) return null;
  return 'As senhas são diferentes';
}
