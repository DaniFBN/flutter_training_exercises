import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:person_manager_test/app/modules/person/data/repositories/person_repository.dart';

import '../../mocks.dart';

void main() {
  final datasource = PersonDatasourceMock();
  final sut = PersonRepository(datasource);
  final param = CreatePersonParamMock();

  group(
    'PersonRepository | Success |',
    () {
      test(
        'Deve retornar uma PersonEntity quando o datasource der certo',
        () async {
          when(() => datasource.create(param))
              .thenAnswer((_) async => PersonEntityMock());

          final response = await sut.create(param);

          expect(response.isRight, isTrue);
        },
      );
    },
  );
}
