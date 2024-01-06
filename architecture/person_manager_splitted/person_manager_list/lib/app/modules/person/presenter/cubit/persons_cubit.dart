import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/address_entity.dart';
import '../../domain/entities/person_entity.dart';
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

    await Future.delayed(const Duration(seconds: 3));

    // final newState = result.fold<PersonsState>(
    //   FailurePersonsState.new,
    //   DataPersonsState.new,
    // );

    // emit(newState);
  }
}

class Persons2Cubit extends Cubit<List<PersonEntity>> {
  Persons2Cubit(this._getPersonsUsecase) : super([]);

  final IGetPersonsUsecase _getPersonsUsecase;

  Future<void> get() async {
    await Future.delayed(const Duration(seconds: 5));

    state.add(
      PersonEntity(
        id: 1,
        name: 'Daniel ${Random().nextInt(9999)}',
        cpf: '',
        birthAt: DateTime.now(),
        email: '',
        phone: '',
        address:
            const AddressEntity(city: '', street: '', number: '', state: ''),
      ),
    );
    
    print(state.hashCode);


    emit(state);
    await Future.delayed(const Duration(seconds: 5));


    print(state.hashCode);

    state.add(
      PersonEntity(
        id: 1,
        name: 'Daniel ${Random().nextInt(9999)}',
        cpf: '',
        birthAt: DateTime.now(),
        email: '',
        phone: '',
        address:
            const AddressEntity(city: '', street: '', number: '', state: ''),
      ),
    );

    print(state.hashCode);

    emit([...state]);

    print(state.hashCode);

    // final newState = result.fold<PersonsState>(
    //   FailurePersonsState.new,
    //   DataPersonsState.new,
    // );

    // emit(newState);
  }
}
