
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkThem= ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,

    ),
    backgroundColor: HexColor('333739'),
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,fontSize: 20.0,
        color: Colors.white),
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,

    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,

    ),


  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.blue,
    type: BottomNavigationBarType.fixed,
    selectedIconTheme: IconThemeData(
        color: Colors.blue
    ),

  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),


);

 ThemeData lightThem= ThemeData(
   primarySwatch: Colors.blue,
   scaffoldBackgroundColor: Colors.white,
   appBarTheme: AppBarTheme(

     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: Colors.white,
       statusBarIconBrightness: Brightness.dark,

     ),
     backgroundColor: Colors.white,
     titleTextStyle: TextStyle(
         fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),
     elevation: 0.0,
     iconTheme: IconThemeData(
       color: Colors.black,

     ),
     actionsIconTheme: IconThemeData(
       color: Colors.black,

     ),


   ),

   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     selectedItemColor: Colors.blue,
     type: BottomNavigationBarType.fixed,
     selectedIconTheme: IconThemeData(
         color: Colors.blue
     ),

   ),
   textTheme: TextTheme(
     bodyText1: TextStyle(
       fontSize: 20.0,
       fontWeight: FontWeight.w600,
       color: Colors.black,
     ),
   ),


 );