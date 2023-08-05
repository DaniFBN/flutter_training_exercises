import 'package:flutter_modular/flutter_modular.dart';
import 'package:person_manager/app/core/services/local_storage/i_local_storage_service.dart';
import 'package:person_manager/app/core/services/local_storage/shared_preferences_local_storage_service.dart';
import 'package:person_manager/app/core/services/snack_bar/i_snack_bar_service.dart';

import 'services/snack_bar/snack_bar_service.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<ILocalStorageService>(
      SharedPreferencesLocalStorageService.new,
    );
    i.addLazySingleton<ISnackBarService>(SnackBarService.new);
  }
}
