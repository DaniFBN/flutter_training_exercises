import 'package:person_manager_modular/app/core/failures/app_failure.dart';

import '../../../domain/entities/person_entity.dart';

sealed class AddPersonState {
  const AddPersonState();
}

class InitialAddPersonState extends AddPersonState {
  const InitialAddPersonState();
}

class LoadingAddPersonState extends AddPersonState {
  const LoadingAddPersonState();
}

class SuccessAddPersonState extends AddPersonState {
  final PersonEntity person;

  const SuccessAddPersonState(this.person);
}

class FailureAddPersonState extends AddPersonState {
  final AppFailure failure;

  const FailureAddPersonState(this.failure);
}
