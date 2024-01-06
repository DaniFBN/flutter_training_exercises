import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/params/create_person_param.dart';
import '../../domain/usecases/create_person_usecase.dart';
import 'state/add_person_state.dart';

class AddPersonCubit extends Cubit<AddPersonState> {
  AddPersonCubit(this._createPersonUsecase)
      : super(const InitialAddPersonState());

  final ICreatePersonUsecase _createPersonUsecase;

  Future<void> create(CreatePersonParam param) async {
    emit(const LoadingAddPersonState());

    await Future.delayed(const Duration(seconds: 3));

    final result = await _createPersonUsecase(param);

    result.fold(
      (l) => emit(FailureAddPersonState(l)),
      (r) => emit(SuccessAddPersonState(r)),
    );

    // final newState = result.fold<AddPersonState>(
    //   FailureAddPersonState.new,
    //   SuccessAddPersonState.new,
    // );

    // emit(newState);
  }
}
