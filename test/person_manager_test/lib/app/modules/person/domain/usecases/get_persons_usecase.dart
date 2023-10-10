import '../../../../core/failure/app_failure.dart';
import '../../../../core/utils/either.dart';
import '../entities/person_entity.dart';
import '../repositories/i_person_repository.dart';

abstract class IGetPersonsUsecase {
  AsyncEither<AppFailure, List<PersonEntity>> call();
}

class GetPersonsUsecase implements IGetPersonsUsecase {
  final IPersonRepository _repository;

  const GetPersonsUsecase(this._repository);

  @override
  AsyncEither<AppFailure, List<PersonEntity>> call() async {
    return _repository.get();
  }
}
