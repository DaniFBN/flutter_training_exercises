import 'package:flutter_modular/flutter_modular.dart';

import '../../interfaces/facade.dart';

class FacadeBindConfig<T extends Facade> extends BindConfig<T> {
  FacadeBindConfig({super.notifier})
      : super(onDispose: (value) => value.dispose());
}

// class FacadeBindConfig extends BindConfig<Facade> {
//   FacadeBindConfig({super.notifier})
//       : super(onDispose: (value) => value.dispose());
// }
