import 'package:dukka_samasys/core/model/employee_data.dart';
import 'package:dukka_samasys/core/model/loan_record_model.dart';
import 'package:dukka_samasys/ui/screens/employees/emloyee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class EmployeeDetail extends StatefulWidget {
  final EmployeeData employeeData;

  const EmployeeDetail({Key key, this.employeeData});
  @override
  State<StatefulWidget> createState() {
    return EmployeeDetailState();
  }
}

class EmployeeDetailState extends State<EmployeeDetail> {
  //The formats a number to a currency format
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
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
              body: ListView(children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                        color: Colors.white,
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                      'assets/images/placeholder.png')),
                              SizedBox(
                                width: 20,
                              ),
                              Column(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.employeeData.fullName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                      Text(
                                        widget.employeeData.position,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        widget.employeeData.phoneNumber,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        widget.employeeData.email,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                              ])
                            ],
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'LOAN RECORD',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),

                //This loads dummy data stated on the view model
                FutureBuilder<List<LoanRecordModel>>(
                    future: model.loan,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          var loadDataList = snapshot.data;
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: loadDataList.length,
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var loadData = loadDataList[index];
                                return Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Card(
                                        color: Colors.white,
                                        elevation: 5.0,
                                        child: Row(children: [
                                          Container(
                                              height: 100,
                                              width: 100,
                                              color: Colors.grey[300],
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.calendar_today,
                                                    color: Colors.blue,
                                                    size: 30,
                                                  ),
                                                  Text(loadData.month)
                                                ],
                                              )),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'BORROWED: ' +
                                                    "\u{20A6}"+ oCcy.format(loadData.borrowed),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                width: 170,
                                                child: Divider(
                                                  thickness: 1,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Text(
                                                  'RECEIVABLE: ' +
                                                     "\u{20A6}"+ oCcy.format( loadData.receivable),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          )
                                        ])));
                              });
                        } else {
                          return Container(
                            height: 0,
                            width: 0,
                          );
                        }
                      }
                      return Container(
                        height: 0,
                        width: 0,
                      );
                    })
              ]));
        });
  }
}
