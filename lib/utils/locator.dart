import 'package:dukka_samasys/core/services/database_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dukka_samasys/utils/progressBarManager/dialogService.dart';
import 'package:dukka_samasys/utils/router/navigationService.dart';
//This is where all the service is declared
GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => DatabaseService());
}
