import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/provider/preferences/preferences_manager.dart';

final getIt = GetIt.instance;

Future<void> globalBindingSetup() async {
  print("global binding");
  final SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferencesManager>(
      () => SharedPreferencesManager(prefs: pref));
}
