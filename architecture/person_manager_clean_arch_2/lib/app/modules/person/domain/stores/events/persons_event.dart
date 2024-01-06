import 'package:person_manager_clean_arch_2/app/core/interfaces/hydrated_bloc.dart';

abstract class PersonsEvent extends HydratedEvent {
  const PersonsEvent();
}

class GetPersonsEvent extends PersonsEvent {
  const GetPersonsEvent();
}
