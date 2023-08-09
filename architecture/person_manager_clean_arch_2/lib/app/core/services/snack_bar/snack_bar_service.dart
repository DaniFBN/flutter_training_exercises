import 'package:flutter/material.dart';

import 'i_snack_bar_service.dart';

class SnackBarService implements ISnackBarService {
  final GlobalKey<ScaffoldMessengerState> key;

  SnackBarService() : key = GlobalKey<ScaffoldMessengerState>();

  @override
  Future<void> showSnackBar(SnackBar snackBar) async {
    key.currentState!.removeCurrentSnackBar();
    key.currentState!.showSnackBar(snackBar);
  }
}
