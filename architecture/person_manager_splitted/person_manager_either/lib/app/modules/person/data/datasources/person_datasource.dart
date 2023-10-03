import '../../../../core/services/local_storage/i_local_storage.dart';
import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';
import '../mappers/person_mapper.dart';
import 'i_person_datasource.dart';

class PersonDatasource implements IPersonDatasource {
  final ILocalStorage _localStorage;

  const PersonDatasource(this._localStorage);

  static const _key = 'persons';

  @override
  Future<PersonEntity> create(CreatePersonParam param) async {
    final data = PersonMapper.createToMap(param);
    final response = await _localStorage.add(_key, data);

    final person = PersonMapper.fromMap(response);
    return person;
  }
}
