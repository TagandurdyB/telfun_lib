import 'package:flutter/cupertino.dart';
import '../MapConverter.dart';
import '../Names.dart';

class ValuesProvider extends ChangeNotifier {
  List _markObjs = [];
  List get markObjs => _markObjs;
  List _modelObjs = [];
  List get modelObjs => _modelObjs;
  List _colorObjs = [];
  List get colorObjs => _colorObjs;
  List _placeObjs = [];
  List get placeObjs => _placeObjs;
  List _etrapObjs = [];
  List get etrapObjs => _etrapObjs;
  List etrapObjsIndex(int welayatIndex) {
    return _placeObjs[welayatIndex].etraps ?? [];
  }
  List _categoryObjs = [];
  List get categoryObjs => _categoryObjs;

  Map<String, List> _all = {
    ApiTags.mark: [],
    ApiTags.model: [],
    ApiTags.colors: [],
    ApiTags.place: [],
    ApiTags.etraps:[],
    ApiTags.categori:[],
  };
  Map get allOfThem => _all;
  List  all(String tag)=>_all[tag];
  List placeEtrapObjs(int welayatIndex) {
    return _all[ApiTags.place][welayatIndex].etraps ?? [];
  }

  void reload() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _markObjs = Get_Lists(listTag: ApiTags.mark).getList();
      _modelObjs = Get_Lists(listTag: ApiTags.model).getList();
      _colorObjs = Get_Lists(listTag: ApiTags.colors).getList();
      _placeObjs = Get_Lists(listTag: ApiTags.place).getList();
      _etrapObjs = Get_Lists(listTag: ApiTags.etraps).getList();
      _categoryObjs = Get_Lists(listTag: ApiTags.categori).getList();
      _all = {
        ApiTags.mark: Get_Lists(listTag: ApiTags.mark).getList(),
        ApiTags.model: Get_Lists(listTag: ApiTags.model).getList(),
        ApiTags.colors: Get_Lists(listTag: ApiTags.colors).getList(),
        ApiTags.place: Get_Lists(listTag: ApiTags.place).getList(),
        ApiTags.etraps: Get_Lists(listTag: ApiTags.etraps).getList(),
        ApiTags.categori:Get_Lists(listTag: ApiTags.categori).getList(),
      };
      notifyListeners();
    });
  }
}
