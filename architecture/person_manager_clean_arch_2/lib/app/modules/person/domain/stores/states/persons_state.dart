import '../../../../../core/exceptions/app_exception.dart';
import '../../entities/person_entity.dart';

sealed class PersonsState {
  const PersonsState();

  factory PersonsState.initState() => const DataPersonsState([]);
}

class LoadingPersonsState extends PersonsState {
  const LoadingPersonsState();
}

class DataPersonsState extends PersonsState {
  final List<PersonEntity> persons;

  const DataPersonsState(this.persons);
}

class ErrorPersonsState extends PersonsState {
  final AppException exception;

  const ErrorPersonsState(this.exception);
}
