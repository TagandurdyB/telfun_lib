import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';

double SWi = 0.0, SHe = 0.0;
int _select = 0, _navBarSelect = 0;
List<DropDBid> filters = List.generate(10, (index) => DropDBid());
int categoriId, categoriIndex = 0, _selectMarkId = 0, _selectMarkIndex = -1;
bool _canAddEvent = false, _isLight;
String _search = "";
StreamController myStreamControler = StreamController();

class DropDBid {
  String value;
  int id;
  DropDBid({this.value, this.id});
}

String _Language = "TU";

class CategoriObj {
  final String name, imgUrl;
  CategoriObj(this.name, this.imgUrl);
}

Widget telfun = ShaderMask(
  shaderCallback: (Rect bounds) {
    return RadialGradient(
      center: Alignment.centerLeft,
      radius: SWi * 0.006,
      colors: <Color>[Color(0xff5700FD), Color(0xffC544FF), Color(0xffFEC002)],
      tileMode: TileMode.mirror,
    ).createShader(bounds);
  },
  child: Text('Telfun', style: TextStyle(fontSize: SWi * 0.06)),
);
List _event;
TabController tabController;

class UsesVar extends ChangeNotifier {
  void changeSearch(String s) {
    _search = s;
    notifyListeners();
  }

  String get getSearch => _search;



  int _sortNum = 0;
  int get sortNum => _sortNum;
  void changeSort(int _num) {
    _sortNum = _num;
    notifyListeners();
  }

  int _count = 0;
  int get count => _count;
  void changeCount(int i) {
    _count = i;
    notifyListeners();
  }

  /////////////////////////////////////////
  List getEvent() {
    return _event;
  }

  void changeEvents(List _list) {
    _event = _list;
    notifyListeners();
  }

  void changeEvent(_obj, index) {
    _event[index] = _obj;
    notifyListeners();
  }
  /////////////////////////////////////////

  void changeMark(i, j) {
    _selectMarkId = i;
    _selectMarkIndex = j;
    notifyListeners();
  }

  List<int> getMark() {
    return [_selectMarkId, _selectMarkIndex];
  }

  void changeCategoryIndex(int _val) {
    categoriIndex = _val;
    notifyListeners();
  }

  int getCategoryIndex() {
    return categoriIndex;
  }

  void changeCanAdd(i) {
    _canAddEvent = i;
    notifyListeners();
  }

  bool get canAdd => _canAddEvent;

  void navBarSelect(i) {
    _navBarSelect = i;
    notifyListeners();
  }

  int witchNavBarSelect() {
    return _navBarSelect;
  }

  void TabChange(i) {
    tabController = i;
    notifyListeners();
  }

  TabController control() {
    return tabController;
  }

  void Select(i) {
    _select = i;
    notifyListeners();
  }

  int witchSelect() {
    return _select;
  }

  void ChangeLang(i) {
    _Language = i;
    notifyListeners();
  }

  String SelectLang() {
    return _Language;
  }
}


