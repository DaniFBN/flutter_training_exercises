import 'account/account_model.dart';

class UserModel {
  final String name;
  final String _password;
  final AccountModel account;

  const UserModel({
    required this.name,
    required this.account,
    required String password,
  }) : _password = password;

  bool validatePassword(String value) {
    if (value == _password) return true;
    return false;
  }

  @override
  String toString() =>
      'UserModel(name: $name, _password: $_password, account: $account)';
}
