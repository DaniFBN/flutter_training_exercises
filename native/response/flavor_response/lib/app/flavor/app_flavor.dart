enum AppEnv { dev, stg, prd }

enum AppClient { dan, fTeam }

class AppFlavor {
  static late final AppEnv env;
  static late final AppClient client;

  static bool get isDev => env == AppEnv.dev;
  static bool get isStg => env == AppEnv.stg;
  static bool get isPrd => env == AppEnv.prd;

  static void changeEnv(String newEnv) {
    env = AppEnv.values.byName(newEnv);
  }

  static void changeClient(String newClient) {
    client = AppClient.values.byName(newClient);
  }
}

class AppUrl {
  static String get serverUrl {
    if (AppFlavor.isPrd) {
      return 'prd.server';
    }

    if (AppFlavor.isStg) {
      return 'stg.server';
    }

    return 'dev.server';
  }
}
