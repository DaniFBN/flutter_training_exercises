import 'package:person_manager_modular/app/core/failures/unknown_failure.dart';

import '../../../../core/failures/app_failure.dart';
import '../../../../core/utils/either.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';
import '../../domain/repositories/i_person_repository.dart';
import '../datasources/i_person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<Either<AppFailure, PersonEntity>> create(
    CreatePersonParam param,
  ) async {
    try {
      final person = await _datasource.create(param);

      return Right(person);
    } on AppFailure catch (e) {
      return Left(e);
    } catch (e, s) {
      final failure = UnknownFailure(
        'Erro genérico',
        innerException: e,
        innerStackTrace: s,
      );

      return Left(failure);
    }
  }
}
