import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/bind_configs/bloc_bind_config.dart';
import '../../core/utils/bind_configs/facade_bind_config.dart';
import 'data/repositories/person_repository.dart';
import 'domain/repositories/person_repository.dart';
import 'domain/stores/create_person_store.dart';
import 'domain/stores/persons_store.dart';
import 'ui/controllers/create_person_controller.dart';
import 'ui/pages/create_person_page.dart';
import 'ui/pages/persons_page.dart';

class PersonBlocModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<IPersonRepository>(PersonRepository.new);

    // Stores
    i.addLazySingleton<PersonsStore>(
      PersonsStore.new,
      config: BlocBindConfig<PersonsStore>(),
    );
    i.addLazySingleton<CreatePersonStore>(
      CreatePersonStore.new,
      config: BlocBindConfig<CreatePersonStore>(),
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
