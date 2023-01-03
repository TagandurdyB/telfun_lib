import 'package:flutter/cupertino.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'ApiElements.dart';

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



  void reload() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _markObjs = Get_Lists(listTag: ApiTags.mark).getList();
      _modelObjs = Get_Lists(listTag: ApiTags.model).getList();
      _colorObjs = Get_Lists(listTag: ApiTags.colors).getList();
      _placeObjs = Get_Lists(listTag: ApiTags.place).getList();
      notifyListeners();
    });
  }

  void tongleFilter(obj, String tag) {
    switch (tag) {
      case JsonTags.filterMark:
        {
          if (isExist(obj, tag)) {
            _markObjs.remove(obj);
          } else {
            _markObjs.add(obj);
          }
        }
        break;
      case JsonTags.filterModel:
        {
          if (isExist(obj, tag)) {
            _modelObjs.remove(obj);
          } else {
            _modelObjs.add(obj);
          }
        }
        break;
      case JsonTags.filterColor:
        {
          if (isExist(obj, tag)) {
            _colorObjs.remove(obj);
          } else {
            _colorObjs.add(obj);
          }
        }
        break;
      case JsonTags.filterPlace:
        {
          if (isExist(obj, tag)) {
            _placeObjs.remove(obj);
          } else {
            _placeObjs.add(obj);
          }
        }
        break;
      case JsonTags.filterEtrap:
        {
          if (isExist(obj, tag)) {
            _etrapObjs.remove(obj);
          } else {
            _etrapObjs.add(obj);
          }
        }
        break;
    }
    notifyListeners();
  }

  bool isExist(obj, String tag) {
    bool _isExist = false;
    switch (tag) {
      case JsonTags.filterMark:
        {
          _isExist = Get_Lists.idList(_markObjs).contains(obj.id);
        }
        break;
      case JsonTags.filterModel:
        {
          _isExist = Get_Lists.idList(_modelObjs).contains(obj.id);
        }
        break;
      case JsonTags.filterColor:
        {
          _isExist = Get_Lists.idList(_colorObjs).contains(obj.id);
        }
        break;
      case JsonTags.filterPlace:
        {
          _isExist = Get_Lists.idList(_placeObjs).contains(obj.id);
        }
        break;
      case JsonTags.filterEtrap:
        {
          _isExist = Get_Lists.idList(_etrapObjs).contains(obj.id);
        }
        break;
    }
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
    _markObjs = [];
    _modelObjs = [];
    _colorObjs = [];
    _placeObjs = [];
    _etrapObjs=[];
    notifyListeners();
  }
}
