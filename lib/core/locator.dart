import 'package:get_it/get_it.dart';

///get it instance
GetIt locator = GetIt.instance;

///initialize locator
void initLocator() {
  //services
  // locator.registerLazySingleton(() => LocalDatabaseApi());

  //view models
  // locator.registerFactory(() => ThemeNotifier());
}
