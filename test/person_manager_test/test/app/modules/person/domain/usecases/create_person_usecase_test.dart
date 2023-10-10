import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:person_manager_test/app/core/failure/app_failure.dart';
import 'package:person_manager_test/app/core/failure/domain_failure.dart';
import 'package:person_manager_test/app/core/utils/either.dart';
import 'package:person_manager_test/app/modules/person/domain/entities/address_entity.dart';
import 'package:person_manager_test/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager_test/app/modules/person/domain/params/create_person_param.dart';
import 'package:person_manager_test/app/modules/person/domain/repositories/i_person_repository.dart';
import 'package:person_manager_test/app/modules/person/domain/usecases/create_person_usecase.dart';

class RepoMock implements IPersonRepository {
  const RepoMock();
  @override
  Future<Either<AppFailure, PersonEntity>> create(CreatePersonParam param) {
    throw UnimplementedError();
  }

  @override
  AsyncEither<AppFailure, List<PersonEntity>> get() {
    throw UnimplementedError();
  }
}

void main() {
  const IPersonRepository repo = RepoMock();
  // SUT - System Under Test
  const sut = CreatePersonUsecase(repo);

  group('CreatePersonUsecase |', () {
    test(
      'Deve retornar DomainFailure quando o nome for inválido por não ter sobrenome e/ou conter algum caractere diferente de [a-zA-Z]',
      () async {
        final param = CreatePersonParam(
          name: '',
          cpf: '205.984.910-15',
          birthAt: DateTime.now(),
          email: 'daniel.noronha@fteam.dev',
          phone: '12123451234',
          address: const AddressEntity(
            city: 'a',
            number: 'a',
            state: 'a',
            street: 'a',
          ),
        );

        final result = await sut(param);

        final failure = result.fold(id, id) as DomainFailure;

        expect(result, isA<Left>()); // Exemplo didático
        expect(failure, isA<DomainFailure>()); // Exemplo didático
        expect(failure.message, equals('Nome inválido'));
      },
    );
  });
}