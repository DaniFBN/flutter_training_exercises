import 'package:flutter/material.dart';

class UserStore extends ValueNotifier<String> {
  UserStore() : super('erro@email.com');

  void setUser(String email) {
    value = email;
  }
}
