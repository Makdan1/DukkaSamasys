import 'package:dukka_samasys/core/services/database_service.dart';
import 'package:dukka_samasys/ui/screens/create_employee/create_employee_view.dart';
import 'package:dukka_samasys/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dukka_samasys/utils/progressBarManager/dialogManager.dart';
import 'package:dukka_samasys/utils/progressBarManager/dialogService.dart';
import 'package:dukka_samasys/utils/router/navigationService.dart';
import 'package:dukka_samasys/utils/router/router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

//Initialize the database
  await DatabaseHelper.initDatabase();
  setupLocator();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samasys',
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
          return ProgressManager(child: child);
          //DialogManager(child: child);
        }),
      ),
      // theme: ThemeData(
      //   textTheme: GoogleFonts.openSansTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      //),
      navigatorKey: locator<NavigationService>().navigationKey,
      home: CreateEmployee(),
      onGenerateRoute: generateRoute,
    );
  }
}
