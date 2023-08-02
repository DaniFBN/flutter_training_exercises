import 'package:flutter/material.dart';

import '../../../domain/usecases/get_persons_usecase.dart';
import 'states/persons_state.dart';

class PersonsStore extends ValueNotifier<PersonsState> {
  PersonsStore(this._getPersonsUsecase) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  PersonsState _state = PersonsState.initState();
  PersonsState get state => _state;

  Future<void> getPersons() async {
    _state = const LoadingPersonsState();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(
      (success) => _state = DataPersonsState(success),
      (failure) => _state = ErrorPersonsState(failure),
    );
    notifyListeners();
  }
}
