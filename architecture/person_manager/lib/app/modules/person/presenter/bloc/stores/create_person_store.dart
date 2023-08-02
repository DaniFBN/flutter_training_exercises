import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/create_person_usecase.dart';
import 'events/create_person_event.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends Bloc<CreatePersonEvent, CreatePersonState> {
  final ICreatePersonUsecase _createPersonUsecase;

  CreatePersonStore(this._createPersonUsecase)
      : super(const InitialCreatePersonState()) {
    on<SubmitCreatePersonEvent>(_create);
  }

  Future<void> _create(
    SubmitCreatePersonEvent event,
    Emitter<CreatePersonState> emit,
  ) async {
    emit(const LoadingCreatePersonState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(event.param);

    result.fold(
      (success) => emit(SuccessCreatePersonState(success)),
      (failure) => emit(ErrorCreatePersonState(failure)),
    );
  }
}
