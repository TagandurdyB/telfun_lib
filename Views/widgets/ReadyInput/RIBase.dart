import 'package:flutter/cupertino.dart';

/*class RIEl {
  final int index;
  final TextEditingController controler;
  RIEl({this.index, this.controler});
}*/

Map<String, TextEditingController> ReadyInputBase = {};

class RIBase {
  static String getText(String tag) {
    if (ReadyInputBase[tag] == null)
      return "";
    else {
      return ReadyInputBase[tag].text;
    }
  }

  static TextEditingController getControl(String tag) {
    if (ReadyInputBase[tag] == null)
      return TextEditingController();
    else {
      return ReadyInputBase[tag];
    }
  }

 static void changeDate(String tag,TextEditingController control) {
    ReadyInputBase.addAll({tag: control});
  }

  static void eraseDate(String tag) {
    ReadyInputBase.addAll(
        {tag: TextEditingController()});
  }
}


