import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/core/failure/app_failure.dart';
import 'package:person_manager_test/app/core/failure/domain_failure.dart';
import 'package:person_manager_test/app/core/utils/either.dart';
import 'package:person_manager_test/app/modules/person/domain/entities/address_entity.dart';
import 'package:person_manager_test/app/modules/person/domain/entities/person_entity.dart';
import 'package:person_manager_test/app/modules/person/domain/usecases/create_person_usecase.dart';

import '../../../../mocks.dart';
import '../../mocks.dart';

void main() {
  final repo = PersonRepositoryMock();
  final usecase = CreatePersonUsecase(repo);
  final param = CreatePersonParamMock();

  setUpAll(() {
    // print('SETUP-ALL - NO INICIO DA SUIT');
  });

  setUp(() {
    when(() => param.name).thenReturn('Daniel Fernandes');
    when(() => param.email).thenReturn('daniel.noronha@fteam.dev');
    when(() => param.birthAt).thenReturn(DateTime.now());
    when(() => param.cpf).thenReturn('443.795.470-00');
    when(() => param.phone).thenReturn('(12) 12345-1234');
    when(() => param.address).thenReturn(
      const AddressEntity(
        street: 'a',
        city: 'a',
        state: 'a',
        number: '1',
      ),
    );
    // param = CreatePersonParamMock();
    // print('SETUP - ANTES DE CADA TEST');
  });

  tearDown(() {
    reset(param);
    reset(repo);
    // print('TEAR-DOWN - DEPOIS DE CADA TEST');
  });

  tearDownAll(() {
    // print('TEAR-DOWN-ALL - NO FINAL');
  });

  group('CreatePersonUsecase | Success |', () {
    test(
      'Deve retornar PersonEntity quando todos os dados forem validos e o repository dar certo',
      () async {
        // Arrange
        when(() => repo.create(param))
            .thenAnswer((_) async => Right(PersonEntityMock()));

        // Act
        final response = await usecase(param);

        // Assert
        expect(response.isRight, isTrue);

        final person = response.fold(id, id) as PersonEntity;
        expect(person, isA<PersonEntity>());

        verify(() => repo.create(param)).called(1);
      },
    );
  });

  group('CreatePersonUsecase | Failure |', () {
    test(
      'Deve retornar AppFailure quando todos os dados forem validos mas o repository der errado',
      () async {
        // Arrange
        when(() => repo.create(param))
            .thenAnswer((_) async => Left(AppFailureMock()));

        // Act
        final response = await usecase(param);

        // Assert
        expect(response.isLeft, isTrue);

        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<AppFailure>());

        verify(() => repo.create(param)).called(1);
      },
    );

    test(
      'Deve retornar DomainFailure quando o nome não tiver sobrenome e/ou tiver caracteres diferentes [a-zA-Z]',
      () async {
        // Arrange
        when(() => param.name).thenReturn('Daniel');

        // Act
        final response = await usecase(param);

        // Assert
        expect(response.isLeft, isTrue);

        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('Nome inválido'));

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando o email não tiver @',
      () async {
        when(() => param.email).thenReturn('daniel.noronha.fteam.dev');

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('Email inválido'));

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando o cpf não tiver 11 números',
      () async {
        when(() => param.cpf).thenReturn('443.795.470-0');

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('CPF inválido'));

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando o cpf tiver 11 números mas o primeiro digito validador for errado',
      () async {
        when(() => param.cpf).thenReturn('443.795.471-00');

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('CPF inválido'));

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando o cpf tiver 11 números mas o segundo digito validador for errado',
      () async {
        when(() => param.cpf).thenReturn('443.795.470-01');

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('CPF inválido'));

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando a data de nascimento for maior que 130 anos atrás',
      () async {
        when(() => param.birthAt).thenReturn(
          DateTime.now().subtract(const Duration(days: 47500)),
        );

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(
          failure.message,
          equals('Data de nascimento inválida. Maior de 130'),
        );

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando o telefone não tiver 11 dígitos',
      () async {
        when(() => param.phone).thenReturn('(12) 12345-123');

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('Telefone inválido'));

        verifyZeroInteractions(repo);
      },
    );

    test(
      'Deve retornar DomainFailure quando o endereço tiver alguma informação vazia',
      () async {
        when(() => param.address).thenReturn(
          const AddressEntity(
            city: 'a',
            state: 'a',
            street: 'a',
            number: '',
          ),
        );

        final response = await usecase(param);

        expect(response.isLeft, isTrue);
        final failure = response.fold(id, id) as AppFailure;
        expect(failure, isA<DomainFailure>());
        expect(failure.message, equals('Endereço inválido'));

        verifyZeroInteractions(repo);
      },
    );
  });
}
