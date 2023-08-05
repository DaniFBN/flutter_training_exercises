import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChangeNotifierBindConfig<T extends ChangeNotifier> extends BindConfig<T> {
  ChangeNotifierBindConfig({super.notifier})
      : super(onDispose: (value) => value.dispose());
}
