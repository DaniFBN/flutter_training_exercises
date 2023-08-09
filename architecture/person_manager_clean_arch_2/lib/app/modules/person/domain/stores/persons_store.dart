import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/person_repository.dart';
import 'events/persons_event.dart';
import 'states/persons_state.dart';

class PersonsStore extends Bloc<PersonsEvent, PersonsState> {
  PersonsStore(this._repository) : super(PersonsState.initState()) {
    on<GetPersonsEvent>((event, emit) => _getPersons(emit));
  }

  final IPersonRepository _repository;

  Future<void> _getPersons(Emitter<PersonsState> emit) async {
    emit(const LoadingPersonsState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _repository.getPersons();

    result.fold(
      (success) => emit(DataPersonsState(success)),
      (failure) => emit(ErrorPersonsState(failure)),
    );
  }
}
