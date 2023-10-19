import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/modules/person/data/datasources/i_person_datasource.dart';
import 'package:person_manager_test/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager_test/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager_test/app/modules/person/domain/repositories/i_person_repository.dart';
import 'package:person_manager_test/app/modules/person/domain/usecases/create_person_usecase.dart';

class PersonRepositoryMock extends Mock implements IPersonRepository {}

class CreatePersonUsecaseMock extends Mock implements ICreatePersonUsecase {}

class PersonDatasourceMock extends Mock implements IPersonDatasource {}

class CreatePersonParamMock extends Mock implements CreatePersonParam {}

class PersonEntityMock extends Mock implements PersonEntity {}
