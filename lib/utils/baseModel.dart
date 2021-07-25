import 'package:flutter/widgets.dart';
import 'package:dukka_samasys/utils/locator.dart';
import 'package:dukka_samasys/utils/progressBarManager/dialogModels.dart';
import 'package:dukka_samasys/utils/progressBarManager/dialogService.dart';

class BaseModel extends ChangeNotifier {
  //final Authentication _authenticationService = locator<Authentication>();
  final ProgressService _dialogService = locator<ProgressService>();
  ProgressResponse hh;
 // Data get currentUser => _authenticationService.currentUser;

  bool _busy = false;
  bool get busy => _busy;




  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
    if(value == true){
      _dialogService.showDialog();
    }else
    {
      _dialogService.dialogComplete(hh);
    }


  }

}
