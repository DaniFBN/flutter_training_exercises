import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class TripleBindConfig<T extends Store> extends BindConfig<T> {
  TripleBindConfig({super.notifier})
      : super(onDispose: (value) => value.destroy());
}
