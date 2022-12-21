import 'package:flutter/material.dart';

import 'Public.dart';

class MyTheme {
  //Colors/////////////////////////////////////////////////////////////////////
  /*Light*/
  static Color lightColorCanves = Colors.white;
  static Color lightColorAppBarIcon = Color(0xff7163DF);
  static Color lightColorNavBarUnIcon = Colors.grey[700];
  static Color lightColorNavBarIcon = Color(0xffC944F6);
  static Color lightColorText = Colors.black;
  /*Dark*/
  static Color darkColorCanves = Color(0xff10083C);
  static Color darkColorAppBarIcon = Colors.white;
  static Color darkColorNavBarUnIcon = Colors.white;
  static Color darkColorNavBarIcon = Color(0xff6A00FF);
  static Color darkColorText = Colors.white;
  //TextStyles/////////////////////////////////////////////////////////////////
  /*Light*/
  static TextStyle lightStyleUserPage = TextStyle(
      fontSize: SWi * 0.045, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle lightStyleEnable = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: SWi * 0.03,
  );
  static TextStyle lightStyleDisable = TextStyle(
    color: Colors.grey,
    fontSize: SWi * 0.03,
  );
  /*Dark*/
  static TextStyle darkStyleUserPage = TextStyle(
      fontSize: SWi * 0.045, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle darkStyleEnable = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: SWi * 0.03,
  );
  static TextStyle darkStyleDisable = TextStyle(
    color: Colors.grey,
    fontSize: SWi * 0.03,
  );
  //Icons//////////////////////////////////////////////////////////////////////
  static Icon lightIconThemeBtn = Icon(Icons.wb_sunny_outlined);
  static Icon darkIconThemeBtn = Icon(
    Icons.nightlight,
    color: Colors.white,
  );
  //Shadows////////////////////////////////////////////////////////////////////
  /*Light*/
  static List<BoxShadow> lightShadowSlider = [
    BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10)
  ];
  static List<BoxShadow> lightShadowSearch = [
    BoxShadow(
        blurRadius: 3,
        spreadRadius: 2,
        color: Colors.grey[200],
        offset: Offset(0, 5))
  ];
  /*Dark*/
  static List<BoxShadow> darkShadowSlider = [];
  static List<BoxShadow> darkShadowSearch = [
    BoxShadow(
        blurRadius: 3,
        spreadRadius: 2,
        color: Color(0xff595476),
        offset: Offset(0, 3))
  ];
  //Brightness/////////////////////////////////////////////////////////////////
  static Brightness lightBrightness = Brightness.light;
  static Brightness darkBrightness = Brightness.dark;
}
