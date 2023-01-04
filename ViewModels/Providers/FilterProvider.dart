import 'package:flutter/cupertino.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';

import '../ApiElements.dart';

class FilterProvider extends ChangeNotifier {
  List _markObjs = [];
  List get markObjs => _markObjs;
  List _modelObjs = [];
  List get modelObjs => _modelObjs;
  List _colorObjs = [];
  List get colorObjs => _colorObjs;
  List _placeObjs = [];
  List _etrapObjs = [];
  List get placeObjs => _placeObjs;

  Map<String, List> _filters = {
    JsonTags.filterMark: [],
    JsonTags.filterModel: [],
    JsonTags.filterColor: [],
    JsonTags.filterPlace: [],
  };
  Map<String, List> get filters => _filters;
  List filter(String tag) => _filters[tag];

  List _savedFilters = [];
  List get savedFilters => _savedFilters;
  Map filtersMap(ElemFilter _obj) => localConverter().filtersToMap(_obj);

  void reload() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _markObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterMark).getList();
      _modelObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterModel).getList();
      _colorObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterColor).getList();
      _placeObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterPlace).getList();
      _filters = {
        JsonTags.filterMark:
            Get_Lists(isApi: false, listTag: JsonTags.filterMark).getList(),
        JsonTags.filterModel:
            Get_Lists(isApi: false, listTag: JsonTags.filterModel).getList(),
        JsonTags.filterColor:
            Get_Lists(isApi: false, listTag: JsonTags.filterColor).getList(),
        JsonTags.filterPlace:
            Get_Lists(isApi: false, listTag: JsonTags.filterPlace).getList(),
      };
      notifyListeners();
    });
  }

  void reloadSaved() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _savedFilters =
          Get_Lists(isApi: false, listTag: JsonTags.filters).getList();
      notifyListeners();
    });
  }

  void tongleFilter(obj, String tag) {
    if (isExist(obj, tag)) {
      _filters[tag].remove(obj);
    } else {
      _filters[tag].add(obj);
    }
    notifyListeners();
  }

  void tongleFilterAll(obj, String tag, bool isAll) {
    if (isExist(obj, tag) && isAll) {
      print("The End++++++ true");
      _filters[tag].remove(obj);
    } else if (!isExist(obj, tag) && !isAll) {
      print("The End++++++ false");
      _filters[tag].add(obj);
    }
    notifyListeners();
  }

  bool isExist(obj, String tag) {
    bool _isExist = false;
    _isExist = Get_Lists.idList(_filters[tag]).contains(obj.id);
    return _isExist;
  }

  void clearMark() {
    _markObjs = [];
    notifyListeners();
  }

  void clearModel() {
    _modelObjs = [];
    notifyListeners();
  }

  void clearColor() {
    _colorObjs = [];
    notifyListeners();
  }

  void clearPlace() {
    _placeObjs = [];
    notifyListeners();
  }

  void clearEtrap() {
    _etrapObjs = [];
    notifyListeners();
  }

  void clearAll() {
    _filters = {
      JsonTags.filterMark: [],
      JsonTags.filterModel: [],
      JsonTags.filterColor: [],
      JsonTags.filterPlace: [],
    };
    notifyListeners();
  }
}