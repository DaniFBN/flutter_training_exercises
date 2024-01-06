import '../../../../../core/failure/app_failure.dart';
import '../../../domain/entities/person_entity.dart';

sealed class PersonsState {
  const PersonsState();

  factory PersonsState.initState() => const DataPersonsState([]);
}

class LoadingPersonsState extends PersonsState {
  const LoadingPersonsState();
}

class FailurePersonsState extends PersonsState {
  final AppFailure failure;

  const FailurePersonsState(this.failure);
}

class DataPersonsState extends PersonsState {
  final List<PersonEntity> persons;

  const DataPersonsState(this.persons);
}
