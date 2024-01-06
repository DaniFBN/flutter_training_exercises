import 'package:flutter_bloc/flutter_bloc.dart';

class HydratedEvent {
  const HydratedEvent();
}

class LoadHydratedEvent extends HydratedEvent {
  const LoadHydratedEvent();
}

class HydratedBloc<E, S> extends Bloc<HydratedEvent, S> {
  HydratedBloc(super.initialState) {
    on<LoadHydratedEvent>(_loadData);

    add(const LoadHydratedEvent());
  }

  void _loadData(LoadHydratedEvent _, Emitter<S> emit) {
    // final state = localStorageGet();

    // emit(state);
  }

  @override
  Future<void> close() {
    // localStoragePost(state);

    return super.close();
  }
}
