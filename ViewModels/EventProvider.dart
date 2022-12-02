import 'package:flutter/cupertino.dart';

List _event;

class Events extends ChangeNotifier {
  List getEvent(){
    return _event;
  }
  void changeEvents(List _list){
    _event=_list;
    notifyListeners();
  }
  void changeEvent(_obj,index){
    _event[index]=_obj;
    notifyListeners();
  }

}
