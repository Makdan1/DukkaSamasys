import 'package:dukka_samasys/core/services/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dukka_samasys/utils/progressBarManager/dialogService.dart';
import 'package:dukka_samasys/utils/router/navigationService.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
  locator.registerLazySingleton(() => MovieService());
}
