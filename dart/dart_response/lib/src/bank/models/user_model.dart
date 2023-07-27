import 'account_model.dart';

class UserModel {
  final String name;
  final String _password;
  final AccountModel account;

  const UserModel({
    required this.name,
    required String password,
    required this.account,
  }) : _password = password;

  bool confirmPassword(String value) {
    return _password == value;
  }
}
