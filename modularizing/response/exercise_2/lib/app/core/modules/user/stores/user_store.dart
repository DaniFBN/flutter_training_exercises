import 'package:flutter/material.dart';

enum UserPermission { page1, page2 }

class UserModel {
  final List<UserPermission> permissions;
  final String email;

  const UserModel({
    required this.permissions,
    required this.email,
  });
}

class UserStore extends ValueNotifier<UserModel?> {
  UserStore() : super(null);

  bool get isLogged => value != null;

  void logout() {
    value = null;
  }

  void setUser(String email) {
    if (!email.contains('@')) return;

    value = UserModel(
      permissions: [UserPermission.page1],
      email: email,
    );
  }
}
