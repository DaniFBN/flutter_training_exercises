import 'package:person_manager_clean_arch_2/app/core/interfaces/repository.dart';

import '../../../../core/exceptions/app_exception.dart';
import '../../../../core/utils/result.dart';
import '../../../../core/services/local_storage/helpers/params.dart';
import '../../../../core/services/local_storage/i_local_storage_service.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';
import '../../domain/repositories/person_repository.dart';
import '../mappers/person_mapper.dart';

final class PersonRepository extends Repository implements IPersonRepository {
  final ILocalStorageService _localStorageService;

  static const _table = 'persons';

  const PersonRepository(this._localStorageService);

  @override
  AsyncResult<PersonEntity, AppException> create(
    CreatePersonParam param,
  ) async {
    return execute(() async {
      final data = PersonMapper.createParamToMap(param);

      final serviceParam = WriteLocalStorageParam(data: data, table: _table);
      final result = await _localStorageService.write(serviceParam);

      final entity = PersonMapper.fromMap(result);

      return Result.success(entity);
    });
  }

  @override
  AsyncResult<List<PersonEntity>, AppException> getPersons() async {
    return execute<List<PersonEntity>>(
      () async {
        final result = await _localStorageService.read(_table);

        final entities = PersonMapper.fromListMap(result).toList();

        return Result.success(entities);
      },
    );
  }
}
