// ignore_for_file: unused_import

import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';
import 'modules/person/person_bloc_module.dart';
import 'modules/person/person_cn_module.dart';
import 'modules/person/person_cubit_module.dart';
import 'modules/person/person_triple_module.dart';
import 'modules/person/person_vn_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    CoreModule(),
  ];

  @override
  void routes(RouteManager r) {
    r.module('/', module: PersonTripleModule());
  }
}
