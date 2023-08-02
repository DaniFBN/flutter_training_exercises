import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/params/create_person_param.dart';
import '../../../domain/usecases/create_person_usecase.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends Cubit<CreatePersonState> {
  final ICreatePersonUsecase _createPersonUsecase;

  CreatePersonStore(this._createPersonUsecase)
      : super(const InitialCreatePersonState());

  Future<void> create(CreatePersonParam param) async {
    emit(const LoadingCreatePersonState());

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(param);

    result.fold(
      (success) => emit(SuccessCreatePersonState(success)),
      (failure) => emit(ErrorCreatePersonState(failure)),
    );
  }
}
