import '../../../../core/failure/app_failure.dart';
import '../../../../core/utils/either.dart';
import '../entities/person_entity.dart';
import '../params/create_person_param.dart';

abstract class IPersonRepository {
  Future<Either<AppFailure, PersonEntity>> create(CreatePersonParam param);
  AsyncEither<AppFailure, List<PersonEntity>> get();
}
