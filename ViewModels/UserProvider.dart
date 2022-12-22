import 'package:flutter/cupertino.dart';

import 'MapConverter.dart';
import 'Names.dart';

class UserProvider extends ChangeNotifier {
  List _allObjs = Get_Lists(listTag: ApiTags.all).getList();
  List _productObjs = Get_Lists(listTag: ApiTags.product).getList();
  List _oldObjs = Get_Lists(listTag: ApiTags.product).getList().where((element) => !element.is_new).toList();
  List _newObjs = Get_Lists(listTag: ApiTags.product).getList().where((element) => element.is_new).toList();
  List _prossesObjs = Get_Lists(listTag: ApiTags.prosses).getList();

  void fillProfile(){
     _productObjs = Get_Lists(listTag: ApiTags.product).getList();
     _oldObjs = _productObjs.where((element) => !element.is_new).toList();
     _newObjs = _productObjs.where((element) => element.is_new).toList();
     notifyListeners();
  }
  List get allObjs => _allObjs;
  List get oldObjs => _oldObjs;
  List get newObjs => _newObjs;
  List get productObjs => _productObjs;
  List get prossesObjs => _prossesObjs;
}
