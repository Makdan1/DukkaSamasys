import 'package:dukka_samasys/ui/screens/create_employee/create_employee_view.dart';
import 'package:dukka_samasys/ui/screens/employees/list_employee.dart';
import 'package:flutter/material.dart';
import 'package:dukka_samasys/utils/router/routeNames.dart';
//This launch the right Page request by the navigation service
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case CreateEmployeeRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateEmployee(),
      );
    case EmployeesRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Employees(),
      );


    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
