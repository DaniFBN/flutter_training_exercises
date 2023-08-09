import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/utils/result.dart';
import '../entities/person_entity.dart';
import '../params/create_person_param.dart';

abstract class IPersonRepository {
  AsyncResult<PersonEntity, AppException> create(CreatePersonParam param);
  AsyncResult<List<PersonEntity>, AppException> getPersons();
}
