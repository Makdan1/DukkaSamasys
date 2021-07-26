import 'package:dukka_samasys/ui/screens/employees/emloyee_view_model.dart';
import 'package:dukka_samasys/ui/screens/employees/employee_detail.dart';
import 'package:dukka_samasys/ui/widget/employee_widget/employee_item.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';


//List of employees screen

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
        onModelReady: (v) {
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
                      width: 3,
                      height: 40,
                      color: Colors.white,
                      child: Text(''),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('SAMASYS', style: TextStyle(fontSize: 28)),
                        Text(
                          'combat salary fraud',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              body: model.employeeDataList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'No Employee added yet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Employees',
                                style: TextStyle(fontSize: 23),
                              )),
                          Expanded(
                              child: Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      // physics: NeverScrollableScrollPhysics(),
                                      itemCount: model.employeeDataList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var data =
                                            model.employeeDataList[index];
                                        return EmployeeItem(
                                          employeeData: data,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          EmployeeDetail(
                                                    employeeData: data,
                                                  ),
                                                ));
                                          },
                                          onDelete: () {
                                            model.deleteEmployee(data);
                                          },
                                        );
                                      })))
                        ]));
        });
  }
}
