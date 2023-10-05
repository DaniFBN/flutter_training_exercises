import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_persons_usecase.dart';
import 'state/persons_state.dart';

class PersonsCubit extends Cubit<PersonsState> {
  PersonsCubit(this._getPersonsUsecase) : super(PersonsState.initState());

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> get() async {
    emit(const LoadingPersonsState());

    await Future.delayed(const Duration(seconds: 3));

    final result = await _getPersonsUsecase();

    result.fold(
      (left) => emit(FailurePersonsState(left)),
      (persons) => emit(DataPersonsState(persons)),
    );

    // final newState = result.fold<PersonsState>(
    //   FailurePersonsState.new,
    //   DataPersonsState.new,
    // );

    // emit(newState);
  }
}
