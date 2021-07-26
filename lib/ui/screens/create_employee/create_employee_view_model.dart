import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:dukka_samasys/core/services/database_service.dart';
import 'package:dukka_samasys/utils/baseModel.dart';
import 'package:dukka_samasys/utils/helpers.dart';
import 'package:dukka_samasys/utils/locator.dart';
import 'package:dukka_samasys/utils/router/navigationService.dart';
import 'package:dukka_samasys/utils/router/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateEmployeeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  final DatabaseService helper = locator<DatabaseService>();

  EmployeeData employeeData;

//Function to save an employee after the save button clicked
  saveEmployee() async {
    setBusy(true);
    var send = {
      "full_name": fullNameController.text,
      "phone_number": phoneController.text,
      "email": emailController.text,
      "position": positionController.text,
      "salary": salaryController.text,
    };
    //This convert the payload to the model
    EmployeeData msg = EmployeeData.fromJson(send);
    notifyListeners();
    print(msg);
    int result;
    //Then the model is passed to the database
    result = await DatabaseService.insertEmployee(msg);

    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Employee saved successfully");
      clear();
      _navigationService.navigateTo(EmployeesRoute);
    } else {
      setBusy(false);
      // Failure
      showToast("Problem Saving Employee'");
    }
  }
//This clears all the controllers so user can start another profile
  clear() {
    fullNameController.clear();
    phoneController.clear();
    emailController.clear();
    positionController.clear();
    salaryController.clear();
  }
}
