import 'dart:async';

import 'package:flutter/material.dart';

import '../../../domain/params/create_person_param.dart';
import '../../../domain/usecases/create_person_usecase.dart';
import 'states/create_person_state.dart';

class CreatePersonStore extends ChangeNotifier {
  final ICreatePersonUsecase _createPersonUsecase;

  CreatePersonStore(this._createPersonUsecase);

  CreatePersonState _state = const InitialCreatePersonState();
  CreatePersonState get state => _state;

  Future<void> create(CreatePersonParam param) async {
    _state = const LoadingCreatePersonState();
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    final result = await _createPersonUsecase(param);

    result.fold(
      (success) => _state = SuccessCreatePersonState(success),
      (failure) => _state = ErrorCreatePersonState(failure),
    );

    notifyListeners();
  }
}
