import 'package:dukka_samasys/ui/screens/create_employee/create_employee_view_model.dart';
import 'package:dukka_samasys/ui/screens/side_bar.dart';
import 'package:dukka_samasys/ui/widget/generalButton.dart';
import 'package:dukka_samasys/utils/screensize.dart';
import 'package:dukka_samasys/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CreateEmployee extends StatefulWidget {
  @override
  MoviesState createState() => new MoviesState();
}

class MoviesState extends State<CreateEmployee> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateEmployeeViewModel>.reactive(
        viewModelBuilder: () => CreateEmployeeViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            key: _scaffoldKey,
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
                      Text('SAMASYS',style: TextStyle(fontSize:28)),
                      Text('combat salary fraud',style: TextStyle(fontSize: 10),),
                    ],
                  )
                ],
              ) ,
            ),
              body: Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: ListView(children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text('CREATE EMPLOYEE PROFILE', style: TextStyle(fontSize: 25),),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Full Name *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            width: Responsive.width(context),
                            child: TextFormField(
                              validator: Validators().isEmpty,
                              controller: model.fullNameController,
                              decoration: InputDecoration(
                                hintText: "",
                                filled: true,
                                fillColor: Colors.white30,
                                labelStyle: TextStyle(color: Colors.blue),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Phone Number *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            width: Responsive.width(context),
                            child: TextFormField(
                              validator: Validators().isNumeric,
                              controller: model.phoneController,
                              decoration: InputDecoration(
                                hintText: "",
                                filled: true,
                                fillColor: Colors.white30,
                                labelStyle: TextStyle(color: Colors.blue),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Email *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            width: Responsive.width(context),
                            child: TextFormField(
                              validator: Validators().isEmail,
                              controller: model.emailController,
                              decoration: InputDecoration(
                                hintText: "",
                                filled: true,
                                fillColor: Colors.white30,
                                labelStyle: TextStyle(color: Colors.blue),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Position *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            width: Responsive.width(context),
                            child: TextFormField(
                              validator: Validators().isEmpty,
                              controller: model.positionController,
                              decoration: InputDecoration(
                                hintText: "",
                                filled: true,
                                fillColor: Colors.white30,
                                labelStyle: TextStyle(color: Colors.blue),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Salary *',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Container(
                            width: Responsive.width(context),
                            child: TextFormField(
                              validator: Validators().isNumericSalary,
                              controller: model.salaryController,
                              decoration: InputDecoration(
                                hintText: "",
                                filled: true,
                                fillColor: Colors.white30,
                                labelStyle: TextStyle(color: Colors.blue),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GeneralButton(
                        buttonText: 'SAVE',
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            model.saveEmployee();
                          }
                        },
                      ),
                      SizedBox(height: 30,)
                    ]),
                  )),
            drawer: CollapsingNavigationDrawer(),

          );
        });
  }
}
