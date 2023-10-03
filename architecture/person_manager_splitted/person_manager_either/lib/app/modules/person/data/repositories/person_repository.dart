import '../../../../core/failure/app_failure.dart';
import '../../../../core/utils/either.dart';
import '../../../../core/utils/repository.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';
import '../../domain/repositories/i_person_repository.dart';
import '../datasources/i_person_datasource.dart';

class PersonRepository extends Repository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<Either<AppFailure, PersonEntity>> create(
    CreatePersonParam param,
  ) async {
    return execute<PersonEntity>(
      callback: () async {
        return await _datasource.create(param);
      },
    );
  }
}
