import 'package:flutter_bloc/flutter_bloc.dart';

import '../repositories/person_repository.dart';
import 'events/create_person_event.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends Bloc<CreatePersonEvent, CreatePersonState> {
  final IPersonRepository _repository;

  CreatePersonStore(this._repository)
      : super(const InitialCreatePersonState()) {
    on<SubmitCreatePersonEvent>(_create);
  }

  Future<void> _create(
    SubmitCreatePersonEvent event,
    Emitter<CreatePersonState> emit,
  ) async {
    emit(const LoadingCreatePersonState());

    final validateResult = event.param.validate();

    final isValid = validateResult.fold<bool>(
      (s) => true,
      (failure) {
        emit(ErrorCreatePersonState(failure));
        return false;
      },
    );

    if (!isValid) return;

    await Future.delayed(const Duration(seconds: 2));

    final result = await _repository.create(event.param);

    result.fold(
      (success) => emit(SuccessCreatePersonState(success)),
      (failure) => emit(ErrorCreatePersonState(failure)),
    );
  }
}
