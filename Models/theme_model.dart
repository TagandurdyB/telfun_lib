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
  static Color lightColorModel = Color(0xffF6F2FA);
  /*Dark*/
  static Color darkColorCanves = Color(0xff10083C);
  static Color darkColorAppBarIcon = Colors.white;
  static Color darkColorNavBarUnIcon = Colors.white;
  static Color darkColorNavBarIcon = Color(0xff6A00FF);
  static Color darkColorText = Colors.white;
  static Color darkColorModel = Color(0xff1A0B6C);
  //TextStyles/////////////////////////////////////////////////////////////////
  /*Light*/
  static TextStyle lightStyleUserPage = TextStyle(
      fontSize: SWi * 0.045, fontWeight: FontWeight.w600, color: Colors.black);
  static TextStyle lightStyleEnable = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: SWi * 0.04,
  );
  static TextStyle lightStyleDisable = TextStyle(
    color: Colors.grey,
    fontSize: SWi * 0.04,
  );
  static TextStyle lightStyleDropDBItems = TextStyle(
    color: Colors.black,
    fontSize: SWi * 0.045,
  );
  static TextStyle lightStyleInputText = TextStyle(
    color: Colors.black,
    fontSize: SWi * 0.04,
  );
  /*Dark*/
  static TextStyle darkStyleUserPage = TextStyle(
      fontSize: SWi * 0.045, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle darkStyleEnable = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: SWi * 0.04,
  );
  static TextStyle darkStyleDisable = TextStyle(
    color: Colors.grey,
    fontSize: SWi * 0.04,
  );
  static TextStyle darkStyleDropDBItems = TextStyle(
    color: Colors.white,
    fontSize: SWi * 0.045,
  );
  static TextStyle darkStyleInputText = TextStyle(
    color: Colors.white,
    fontSize: SWi * 0.04,
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
  static List<BoxShadow> lightShadowModel = [
    BoxShadow(
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(1, 3),
        color: Colors.grey),
    BoxShadow(
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(-1, 3),
        color: Colors.grey)
  ];
  static List<BoxShadow> lightShadowDown = [
    BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 5)
  ];
  static List<BoxShadow> lightShadowUp = [
    BoxShadow(color: Colors.grey, offset: Offset(0, -5), blurRadius: 5)
  ];
  static List<BoxShadow> lightShadowAll = [
    BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 0)
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
  static List<BoxShadow> darkShadowModel = [
    BoxShadow(
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(1, 3),
        color: Color(0xff10093B)),
    BoxShadow(
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(-1, 3),
        color: Color(0xff10093B))
  ];
  static List<BoxShadow> darkShadowDown = [
    BoxShadow(color: Colors.grey[600], offset: Offset(0, 5), blurRadius: 5)
  ];
  static List<BoxShadow> darkShadowUp = [
    BoxShadow(color: Colors.grey[600], offset: Offset(0, -5), blurRadius: 5)
  ];
  static List<BoxShadow> darkShadowAll = [
    BoxShadow(color: Colors.grey[600], blurRadius: 10, spreadRadius: 0)
  ];
  //Brightness/////////////////////////////////////////////////////////////////
  static Brightness lightBrightness = Brightness.light;
  static Brightness darkBrightness = Brightness.dark;
}
