import 'package:result_dart/result_dart.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../entities/person_entity.dart';
import '../repositories/person_repository.dart';

abstract interface class IGetPersonsUsecase {
  AsyncResult<List<PersonEntity>, AppException> call();
}

class GetPersonsUsecase implements IGetPersonsUsecase {
  final IPersonRepository _repository;

  const GetPersonsUsecase(this._repository);

  @override
  AsyncResult<List<PersonEntity>, AppException> call() {
    return _repository.getPersons();
  }
}
