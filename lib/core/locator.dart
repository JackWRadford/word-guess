import 'package:get_it/get_it.dart';
import 'package:word_guess/core/services/shared_pref_service.dart';
import 'package:word_guess/core/themeNotifier.dart';
import 'package:word_guess/core/viewModels/game_model.dart';
import 'package:word_guess/core/viewModels/statistics_model.dart';

///get it instance
GetIt locator = GetIt.instance;

///initialize locator
void initLocator() {
  //services
  locator.registerLazySingleton(() => SharedPrefService());

  //view models
  locator.registerFactory(() => GameModel());
  locator.registerFactory(() => StatisticsModel());
  locator.registerFactory(() => ThemeNotifier());
}
