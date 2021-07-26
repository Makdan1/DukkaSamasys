import 'package:dukka_samasys/ui/screens/employees/emloyee_view_model.dart';
import 'package:dukka_samasys/ui/widget/employee_widget/employee_item.dart';
import 'package:dukka_samasys/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Employees extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeesState();
  }
}

class EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
        onModelReady: (v){
          v.getEmployees();
        },
        viewModelBuilder: () => EmployeeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 3,height: 40,
                      color: Colors.white,
                      child: Text(''),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('SAMASYS',style: TextStyle(fontSize:30)),
                        Text('combat salary fraud',style: TextStyle(fontSize: 10),),
                      ],
                    )
                  ],
                ) ,
              ),
              body: Column(
                  children: [
                    model.employeeDataList.isEmpty
                        ? Container(
                      child: Text('EMPTY'),
                    ) :
                    Expanded(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount:
                                model.employeeDataList.length,
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  var data = model.employeeDataList[index];
                                  return
                                    EmployeeItem(
                                      employeeData: data,
                                      // onCall: () async{
                                      //   contact = await model.getSinglePackage(feed.id.toString());
                                      //   callStore();
                                      // },
                                      //onTap: () {
                                      // attendanceDialog(
                                      //     model, feed.pinCode, feed.responsibility);
                                      // model.takeAttendanceTeachers(status, teacherPinCode)
                                      // deleteAlert(
                                      //     model, feed.id.toString());
                                      //},
                                      // onEdit: () {
                                      //   Navigator.push<void>(
                                      //     context,
                                      //     MaterialPageRoute<void>(
                                      //       builder:
                                      //           (BuildContext context) =>
                                      //           TeacherEditPage(
                                      //               teacherDetails:
                                      //               feed),
                                      //     ),
                                      //   );
                                      // },
                                    );
                                }

                            )))
                  ]));
        });
  }
}