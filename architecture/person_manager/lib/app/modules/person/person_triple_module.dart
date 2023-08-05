import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/modules/person/domain/repositories/person_repository.dart';

import '../../core/utils/bind_configs/facade_bind_config.dart';
import '../../core/utils/bind_configs/triple_bind_config.dart';
import 'domain/usecases/create_person_usecase.dart';
import 'domain/usecases/get_persons_usecase.dart';
import 'external/person_datasource.dart';
import 'infra/datasources/person_datasource.dart';
import 'infra/repositories/person_repository.dart';
import 'presenter/triple/controllers/create_person_controller.dart';
import 'presenter/triple/pages/create_person_page.dart';
import 'presenter/triple/pages/persons_page.dart';
import 'presenter/triple/stores/create_person_store.dart';
import 'presenter/triple/stores/persons_store.dart';

class PersonTripleModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<IPersonDatasource>(PersonDatasource.new);
    i.addLazySingleton<IPersonRepository>(PersonRepository.new);

    // Usecases
    i.addLazySingleton<IGetPersonsUsecase>(GetPersonsUsecase.new);
    i.addLazySingleton<ICreatePersonUsecase>(CreatePersonUsecase.new);

    // Stores
    i.addLazySingleton<PersonsStore>(
      PersonsStore.new,
      config: TripleBindConfig<PersonsStore>(),
    );
    i.addLazySingleton<CreatePersonStore>(
      CreatePersonStore.new,
      config: TripleBindConfig<CreatePersonStore>(),
    );

    // Controllers
    i.addLazySingleton<CreatePersonController>(
      CreatePersonController.new,
      config: FacadeBindConfig<CreatePersonController>(),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => PersonsPage(store: Modular.get()));
    r.child(
      '/create',
      child: (_) => CreatePersonPage(controller: Modular.get()),
    );
  }
}
