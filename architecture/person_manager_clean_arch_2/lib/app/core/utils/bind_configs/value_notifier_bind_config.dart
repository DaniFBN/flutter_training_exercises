import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ValueNotifierBindConfig<T extends ValueNotifier> extends BindConfig<T> {
  ValueNotifierBindConfig({super.notifier})
      : super(onDispose: (value) => value.dispose());
}
