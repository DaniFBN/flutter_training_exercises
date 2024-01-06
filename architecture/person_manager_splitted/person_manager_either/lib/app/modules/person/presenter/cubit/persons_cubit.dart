import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_persons_usecase.dart';
import 'state/persons_state.dart';

class PersonsCubit extends Cubit<PersonsState> {
  PersonsCubit(
    this._getPersonsUsecase,
  ) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> get() async {
    emit(const LoadingPersonsState());

    await Future.delayed(const Duration(seconds: 3));

    final response = await _getPersonsUsecase();

    response.fold(
      (left) => emit(FailurePersonsState(left)),
      (right) => emit(DataPersonsState(right)),
    );
  }
}
