import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/core/utils/either.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/add_person_cubit.dart';
import 'package:person_manager_test/app/modules/person/presenter/cubit/state/add_person_state.dart';

import '../../../../mocks.dart';
import '../../mocks.dart';

void main() {
  final usecase = CreatePersonUsecaseMock();
  final param = CreatePersonParamMock();
  late AddPersonCubit sut;

  setUp(() {
    sut = AddPersonCubit(usecase);
  });
  tearDown(() => reset(usecase));

  group('AddPersonCubit | Success |', () {
    test(
      'Native | Deve emitir [Loading, Success] quando o usecase der certo',
      () async {
        when(() => usecase(param))
            .thenAnswer((_) async => Right(PersonEntityMock()));

        expect(
          sut.stream,
          emitsInOrder([
            isA<LoadingAddPersonState>(),
            isA<SuccessAddPersonState>(),
          ]),
        );

        await sut.create(param);

        verify(() => usecase(param)).called(1);
      },
    );

    blocTest(
      'BlocTest | Deve emitir [Loading, Success] quando o usecase der certo',
      build: () {
        when(() => usecase(param))
            .thenAnswer((_) async => Right(PersonEntityMock()));

        return AddPersonCubit(usecase);
      },
      act: (bloc) => bloc.create(param),
      expect: () => [
        isA<LoadingAddPersonState>(),
        isA<SuccessAddPersonState>(),
      ],
    );
  });

  group('AddPersonCubit | Failure |', () {
    test(
      'Native | Deve emitir [Loading, Failure] quando o usecase der errado',
      () async {
        when(() => usecase(param))
            .thenAnswer((_) async => Left(AppFailureMock()));

        expect(
          sut.stream,
          emitsInOrder([
            isA<LoadingAddPersonState>(),
            isA<FailureAddPersonState>(),
          ]),
        );

        await sut.create(param);

        verify(() => usecase(param)).called(1);
      },
    );

    blocTest(
      'BlocTest | Deve emitir [Loading, Failure] quando o usecase der errado',
      build: () {
        when(() => usecase(param))
            .thenAnswer((_) async => Left(AppFailureMock()));

        return AddPersonCubit(usecase);
      },
      act: (bloc) => bloc.create(param),
      expect: () => [
        isA<LoadingAddPersonState>(),
        isA<FailureAddPersonState>(),
      ],
    );
  });
}
