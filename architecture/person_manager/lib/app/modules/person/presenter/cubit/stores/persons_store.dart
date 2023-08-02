import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_persons_usecase.dart';
import 'states/persons_state.dart';

class PersonsStore extends Cubit<PersonsState> {
  PersonsStore(this._getPersonsUsecase) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    emit(const LoadingPersonsState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(
      (success) => emit(DataPersonsState(success)),
      (failure) => emit(ErrorPersonsState(failure)),
    );
  }
}
