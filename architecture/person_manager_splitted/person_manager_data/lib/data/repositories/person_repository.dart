import '../../domain/entities/person_entity.dart';
import '../../domain/params/create_person_param.dart';
import '../../domain/repositories/i_person_repository.dart';
import '../datasources/i_person_datasource.dart';

class PersonRepository implements IPersonRepository {
  final IPersonDatasource _datasource;

  const PersonRepository(this._datasource);

  @override
  Future<PersonEntity> create(CreatePersonParam param) async {
    final person = await _datasource.create(param);

    return person;
  }
}
