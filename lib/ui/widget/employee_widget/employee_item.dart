import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:dukka_samasys/utils/helpers.dart';
import 'package:flutter/material.dart';

class EmployeeItem extends StatelessWidget {
  final EmployeeData employeeData;
  final Function onTap;
  final Function onDelete;

  EmployeeItem({this.employeeData, this.onTap, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Card(
            color: Colors.white,
            elevation: 5.0,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        if (onTap != null) {
                          onTap();
                        }
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset('assets/images/placeholder.png'))),
                  SizedBox(
                    width: 20,
                  ),
                  Column(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              if (onTap != null) {
                                onTap();
                              }
                            },
                            child: Text(employeeData.fullName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          Text(
                            employeeData.position,
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Text(
                            employeeData.phoneNumber,
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Text(
                            employeeData.email,
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            showErrorToast(
                                'The feature is not available at the moment');
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (onDelete != null) {
                              onDelete();
                            }
                          },
                          child: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    )
                  ])
                ],
              ),
            )));
  }
}
