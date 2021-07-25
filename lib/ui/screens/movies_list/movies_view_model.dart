import 'package:dukka_samasys/core/services/auth_service.dart';
import 'package:dukka_samasys/utils/baseModel.dart';
import 'package:dukka_samasys/utils/locator.dart';
import 'package:dukka_samasys/utils/router/navigationService.dart';

class MoviesViewModel extends BaseModel {
  final MovieService _authentication = locator<MovieService>();
  final NavigationService _navigationService = locator<NavigationService>();

  // Future<List<Results>> fetchMovies() async {
  //   //setBusy(true);
  //   var result = await _authentication.getMovies();
  //   if (result is ErrorModel) {
  //     // showToast('Login failed');
  //     print(result.error);
  //     notifyListeners();
  //     throw Exception('Failed to load internet');
  //     //return ErrorModel(result.error);
  //   }
  //   print(result);
  //   return result;
  // }
}
