import 'package:flutter/cupertino.dart';

class DDBEl {
  int id, index;
  Widget child;
  String value;
  DDBEl({this.index, this.id, this.value,this.child});
}

class DDBBase {
  DDBEl getDate(String tag) {
    if (DropDownBase[tag] == null)
      return DDBEl(index: -1, id: 0, value: "NULL");
    else {
      return DropDownBase[tag];
    }
  }

  void changeDate(DDBEl val,String tag) {
    DropDownBase.addAll({tag:val});
  }

  void eraseDate(String tag) {
    DropDownBase.addAll({tag:DDBEl(value: "NULL",index: -1,id: 0)});
  }
}

Map<String, DDBEl> DropDownBase = {};
