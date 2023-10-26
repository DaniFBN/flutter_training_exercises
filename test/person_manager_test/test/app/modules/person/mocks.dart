import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/modules/person/data/datasources/i_person_datasource.dart';
import 'package:person_manager_test/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager_test/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager_test/app/modules/person/domain/repositories/i_person_repository.dart';
import 'package:person_manager_test/app/modules/person/domain/usecases/create_person_usecase.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/add_person_cubit.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/persons_cubit.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/state/add_person_state.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/state/persons_state.dart';

class PersonRepositoryMock extends Mock implements IPersonRepository {}

class CreatePersonUsecaseMock extends Mock implements ICreatePersonUsecase {}

class PersonDatasourceMock extends Mock implements IPersonDatasource {}

class CreatePersonParamMock extends Mock implements CreatePersonParam {}

class PersonEntityMock extends Mock implements PersonEntity {}

class PersonsCubitMock extends MockCubit<PersonsState>
    implements PersonsCubit {}

class AddPersonCubitMock extends MockCubit<AddPersonState>
    implements AddPersonCubit {}

class CreatePersonParamFake extends Fake implements CreatePersonParam {}
