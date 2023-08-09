import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BlocBindConfig<T extends Bloc> extends BindConfig<T> {
  BlocBindConfig({super.notifier}) : super(onDispose: (value) => value.close());
}
