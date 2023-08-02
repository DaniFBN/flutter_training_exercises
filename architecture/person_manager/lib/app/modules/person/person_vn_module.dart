import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/create_person_usecase.dart';
import 'domain/usecases/get_persons_usecase.dart';
import 'external/person_datasource.dart';
import 'infra/repositories/person_repository.dart';
import 'presenter/value_notifier/controllers/create_person_controller.dart';
import 'presenter/value_notifier/pages/create_person_page.dart';
import 'presenter/value_notifier/pages/persons_page.dart';
import 'presenter/value_notifier/stores/create_person_store.dart';
import 'presenter/value_notifier/stores/persons_store.dart';

class PersonVnModule extends Module {
  @override
  final List<Bind<Object>> binds = [
    Bind.lazySingleton((i) => PersonDatasource(i())),
    Bind.lazySingleton((i) => PersonRepository(i())),

    // Usecases
    Bind.lazySingleton((i) => GetPersonsUsecase(i())),
    Bind.lazySingleton((i) => CreatePersonUsecase(i())),

    // Stores
    Bind.lazySingleton((i) => PersonsStore(i())),
    Bind.lazySingleton((i) => CreatePersonStore(i())),

    // Controllers
    Bind.lazySingleton(
      (i) => CreatePersonController(
        createStore: i(),
        personsStore: i(),
        snackBarService: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => PersonsPage(store: Modular.get()),
    ),
    ChildRoute(
      '/create',
      child: (_, __) => CreatePersonPage(controller: Modular.get()),
    )
  ];
}
