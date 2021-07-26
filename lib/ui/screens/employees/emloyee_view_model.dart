import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:dukka_samasys/core/services/auth_service.dart';
import 'package:dukka_samasys/core/services/database_service.dart';
import 'package:dukka_samasys/utils/baseModel.dart';

class EmployeeViewModel extends BaseModel {

  EmployeeData employeeData;
  DatabaseHelper helper = DatabaseHelper();
  DatabaseHelper databaseHelper = DatabaseHelper();
  int count = 0;

  List<EmployeeData> employeeDataList = [];

  getEmployees() async {

    List<EmployeeData> res =

    await databaseHelper.getEmployeeList();
    if (res.length > 0) {
      employeeDataList = res;
      notifyListeners();
    }
    return employeeDataList;
  }

}


