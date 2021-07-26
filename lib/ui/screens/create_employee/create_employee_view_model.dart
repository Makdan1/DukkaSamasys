import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:dukka_samasys/core/services/auth_service.dart';
import 'package:dukka_samasys/core/services/database_service.dart';
import 'package:dukka_samasys/utils/baseModel.dart';
import 'package:dukka_samasys/utils/helpers.dart';
import 'package:dukka_samasys/utils/locator.dart';
import 'package:dukka_samasys/utils/router/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateEmployeeViewModel extends BaseModel {
  final MovieService _authentication = locator<MovieService>();
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();

  EmployeeData employeeData;
  DatabaseHelper helper = DatabaseHelper();

  saveEmployee() async {
    setBusy(true);
    var send = {
      "full_name": fullNameController.text,
      "phone_number": phoneController.text,
      "email": emailController.text,
      "position": positionController.text,
      "salary": salaryController.text,
    };
    EmployeeData msg = EmployeeData.fromJson(send);
    notifyListeners();
    print(msg);
    int result;
    result = await DatabaseHelper.insertEmployee(msg);

    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Employee saved successfully");
      clear();
    } else {
      setBusy(false);
      // Failure
      showToast("Problem Saving Employee'");
    }
  }

  clear() {
    fullNameController.clear();
    phoneController.clear();
    emailController.clear();
    positionController.clear();
    salaryController.clear();
  }
}
