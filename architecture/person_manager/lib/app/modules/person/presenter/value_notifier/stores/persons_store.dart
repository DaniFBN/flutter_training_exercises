import 'package:flutter/material.dart';

import '../../../domain/usecases/get_persons_usecase.dart';
import 'states/persons_state.dart';

class PersonsStore extends ValueNotifier<PersonsState> {
  PersonsStore(this._getPersonsUsecase) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> getPersons() async {
    value = const LoadingPersonsState();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _getPersonsUsecase();

    result.fold(
      (success) => value = DataPersonsState(success),
      (failure) => value = ErrorPersonsState(failure),
    );
  }
}
