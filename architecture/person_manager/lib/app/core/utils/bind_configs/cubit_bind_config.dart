import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CubitBindConfig<T extends Cubit> extends BindConfig<T> {
  CubitBindConfig({super.notifier})
      : super(onDispose: (value) => value.close());
}
