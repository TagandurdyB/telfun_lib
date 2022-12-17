import 'package:flutter/cupertino.dart';
import 'package:telfun/Models/ChatElement.dart';

class SMSProvider extends ChangeNotifier {
  List<ElemChat> _mesages=[];
  List<ElemChat> get megades=>_mesages;
  void reload(){
    _mesages=[];
    notifyListeners();
  }
  void addMessage(ElemChat _SMS){
    _mesages.add(_SMS);
    notifyListeners();
  }
}