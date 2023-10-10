import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/local_storage/i_local_storage.dart';
import 'services/local_storage/shared_preferences_local_storage.dart';

late final SharedPreferences _sharedPreferences;

class CoreModule extends Module {
  static Future<void> initializeAsyncBinds() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void exportedBinds(Injector i) {
    i.addInstance<SharedPreferences>(_sharedPreferences);
    i.addLazySingleton<ILocalStorage>(SharedPreferencesLocalStorage.new);
  }
}
