import 'package:flutter_test/flutter_test.dart';
import 'package:person_manager_test/app/core/failure/app_failure.dart';
import 'package:person_manager_test/app/core/failure/unknown_failure.dart';
import 'package:person_manager_test/app/core/utils/either.dart';
import 'package:person_manager_test/app/core/utils/repository.dart';

import '../../mocks.dart';

class _Repository extends Repository {}

void main() {
  final sut = _Repository();

  group(
    'Repository | Success |',
    () {
      test(
        'Deve retornar o Right com o valor do callback quando der certo',
        () async {
          final response = await sut.execute<String>(callback: () async {
            return 'Deu certo';
          });

          expect(response.isRight, isTrue);
          final right = response.fold(id, id) as String;
          expect(right, 'Deu certo');
        },
      );
    },
  );

  group(
    'Repository | Failure |',
    () {
      test(
        'Deve retornar uma AppFailure quando o callback recebido lançar uma AppFailure',
        () async {
          final response = await sut.execute<void>(callback: () async {
            throw AppFailureMock();
          });

          expect(response.isLeft, isTrue);
          final failure = response.fold(id, id) as AppFailure;
          expect(failure, isA<AppFailure>());
        },
      );

      test(
        'Deve retornar uma UnknownFailure quando o callback recebido lançar um erro que não seja AppFailure',
        () async {
          final response = await sut.execute<void>(callback: () async {
            throw Exception();
          });

          expect(response.isLeft, isTrue);
          final failure = response.fold(id, id) as AppFailure;
          expect(failure, isA<UnknownFailure>());
        },
      );
    },
  );
}
