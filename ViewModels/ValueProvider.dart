import 'package:flutter/cupertino.dart';
import 'MapConverter.dart';
import 'Names.dart';

class ValuesProvider extends ChangeNotifier {
  List _markObjs = [];
  List get markObjs => _markObjs;
  List _modelObjs = [];
  List get modelObjs => _modelObjs;
  List _colorObjs = [];
  List get colorObjs => _colorObjs;
  List _placeObjs = [];
  List get placeObjs => _placeObjs;
  List etrapObjs(int welayatIndex) {
    return _placeObjs[welayatIndex].etraps ?? [];
  }
  List _categoryObjs = [];
  List get categoryObjs => _categoryObjs;

  void reload() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _markObjs = Get_Lists(listTag: ApiTags.mark).getList();
      _modelObjs = Get_Lists(listTag: ApiTags.model).getList();
      _colorObjs = Get_Lists(listTag: ApiTags.colors).getList();
      _placeObjs = Get_Lists(listTag: ApiTags.place).getList();
      _categoryObjs = Get_Lists(listTag: ApiTags.categori).getList();
      notifyListeners();
    });
  }
}
