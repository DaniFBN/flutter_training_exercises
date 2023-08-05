import '../../../../../../core/exceptions/app_exception.dart';
import '../../../../domain/entities/person_entity.dart';

sealed class CreatePersonState {
  const CreatePersonState();
}

class InitialCreatePersonState extends CreatePersonState {
  const InitialCreatePersonState();
}

class LoadingCreatePersonState extends CreatePersonState {
  const LoadingCreatePersonState();
}

class SuccessCreatePersonState extends CreatePersonState {
  final PersonEntity person;

  const SuccessCreatePersonState(this.person);
}

class ErrorCreatePersonState extends CreatePersonState {
  final AppException exception;

  const ErrorCreatePersonState(this.exception);
}
