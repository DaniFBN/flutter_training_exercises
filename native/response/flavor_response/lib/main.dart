// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'app/flavor/app_flavor.dart';

void main() {
  const env = String.fromEnvironment('env', defaultValue: 'dev');
  AppFlavor.changeEnv(env);

  const client = String.fromEnvironment('client', defaultValue: 'dan');
  AppFlavor.changeClient(client);

  runApp(const AppWidget());
}
