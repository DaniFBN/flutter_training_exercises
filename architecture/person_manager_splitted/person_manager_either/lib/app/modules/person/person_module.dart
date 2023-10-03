import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import 'data/datasources/i_person_datasource.dart';
import 'data/datasources/person_datasource.dart';
import 'data/repositories/person_repository.dart';
import 'domain/repositories/i_person_repository.dart';
import 'domain/usecases/create_person_usecase.dart';
import 'presenter/cubit/add_person_cubit.dart';
import 'presenter/pages/add_person_page.dart';

class PersonModule extends Module {
  
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(AddPersonCubit.new);
    i.addLazySingleton<ICreatePersonUsecase>(CreatePersonUsecase.new);
    i.addLazySingleton<IPersonRepository>(PersonRepository.new);
    i.addLazySingleton<IPersonDatasource>(PersonDatasource.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => AddPersonPage(cubit: Modular.get<AddPersonCubit>()),
    );
  }
}
