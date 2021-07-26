import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:dukka_samasys/core/model/loan_record_model.dart';
import 'package:dukka_samasys/core/services/database_service.dart';
import 'package:dukka_samasys/utils/baseModel.dart';
import 'package:dukka_samasys/utils/helpers.dart';

class EmployeeViewModel extends BaseModel {
  EmployeeData employeeData;
  DatabaseHelper helper = DatabaseHelper();
  DatabaseHelper databaseHelper = DatabaseHelper();
  int count = 0;

  List<EmployeeData> employeeDataList = [];

  getEmployees() async {
    List<EmployeeData> res = await databaseHelper.getEmployeeList();
   if(res == null){
     employeeDataList =  [];
   }

  else  if (res.length > 0) {
      employeeDataList = res;
      notifyListeners();
    }
    return employeeDataList;
  }

  deleteEmployee(EmployeeData employeeData) async {
    setBusy(true);
    int result;
    result = await databaseHelper.deleteEmployee(employeeData);
    if (result != 0) {
      setBusy(false);
      //Success
      showToast("Employee deleted successfully");
      getEmployees();
      notifyListeners();
    } else {
      setBusy(false);
      // Failure
      showToast("Problem deleting Employee'");
      notifyListeners();
    }
  }

  Future<List<LoanRecordModel>> get loan async {
    return [
        LoanRecordModel(
          month:"Jan" ,
            borrowed: 50000,
            receivable:100000,
        ),
      LoanRecordModel(
        month:"FEB" ,
        borrowed: 50000,
        receivable:100000 ,
      ),
      LoanRecordModel(
        month:"MAR" ,
        borrowed: 50000,
        receivable:100000 ,
      ),

    ];
  }
}

