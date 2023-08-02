import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/person_entity.dart';
import '../../../domain/usecases/get_persons_usecase.dart';

class PersonsStore extends Store<List<PersonEntity>> {
  PersonsStore(this._getPersonsUsecase) : super([]);

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    setLoading(true);

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(update, setError);
  }
}
