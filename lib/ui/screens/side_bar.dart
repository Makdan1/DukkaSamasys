import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CollapsingNavigationDrawer extends StatefulWidget{
  @override
  CollapsingNavigationDrawerState createState(){
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>  with TickerProviderStateMixin{
  double maxWidth = 180;
  double minWidth = 90;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth).animate(_animationController);
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context, widget) => getWidget(context, widget),);
  }


  Widget getWidget(context, widget){
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return
      Material(
          elevation: 10.0,
          child: Container(
            width:300,
            height: deviceHeight,
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),

              child: ListView(
//crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },

                            child:
                            Icon(
                              Icons.clear,color: Colors.white,
                            )
                        ),
                      ],
                    ),

                    SizedBox(height: 20,),
                    ListTile(
                      title:
                      Text('EMPLOYEES',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      onTap: () {

                        // _navigationService.navigateTo(ComingScreenRoute);

                        // Navigator.pushNamed(context, "/StoreBottom");
                      },
                    ),


                  ]
              ),
            ),
          )
      );

  }

}