import 'package:flutter/cupertino.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/Views/widgets/FilterSwitch.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';

import '../ApiElements.dart';

class FilterProvider extends ChangeNotifier {
  List _markObjs = [];
  List get markObjs => _markObjs;
  List _modelObjs = [];
  List get modelObjs => _modelObjs;
  List _colorObjs = [];
  List get colorObjs => _colorObjs;
  List _etrapObjs = [];
  List get etrapObjs => _etrapObjs;

  Map<String, List> _filters = {
    JsonTags.filterMark: [],
    JsonTags.filterModel: [],
    JsonTags.filterColor: [],
    JsonTags.filterEtrap: [],
    JsonTags.filterPrice: [0, 0],
    JsonTags.filterTime: [DDBEl(id: 0, value: "")],
  };
  void filterFill(Map _obj) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _filters = _obj;
    });
    notifyListeners();
  }

  Map<String, List> get filters => _filters;
  List filter(String tag) => _filters[tag];

  List filterMap(String tag) =>
      MapConverter(JsonName: tag, ElemList: _filters[tag]).toMap();
  Map filterMaps() => {
        JsonTags.filterMark: filterMap(JsonTags.filterMark),
        JsonTags.filterModel: filterMap(JsonTags.filterModel),
        JsonTags.filterColor: filterMap(JsonTags.filterColor),
        JsonTags.filterEtrap: filterMap(JsonTags.filterEtrap),
        JsonTags.filterPrice: filterMap(JsonTags.filterPrice),
        JsonTags.filterTime: filterMap(JsonTags.filterTime),
      };

  List filterObj(String tag, List list) =>
      MapConverter(JsonName: tag, MapList: list).toElem();
  Map filterObjs(Map _filterMaps) => {
        JsonTags.filterMark:
            filterObj(JsonTags.filterMark, _filterMaps[JsonTags.filterMark]),
        JsonTags.filterModel:
            filterObj(JsonTags.filterModel, _filterMaps[JsonTags.filterModel]),
        JsonTags.filterColor:
            filterObj(JsonTags.filterColor, _filterMaps[JsonTags.filterColor]),
        JsonTags.filterEtrap:
            filterObj(JsonTags.filterEtrap, _filterMaps[JsonTags.filterEtrap]),
        JsonTags.filterPrice:
            filterObj(JsonTags.filterPrice, _filterMaps[JsonTags.filterPrice]),
        JsonTags.filterTime:
            filterObj(JsonTags.filterTime, _filterMaps[JsonTags.filterTime]),
      };

  List findEtrapObjs(int welayatId) {
    return _filters[JsonTags.filterEtrap]
        .where((element) => element.place_id == welayatId)
        .toList();
  }

  List _savedFilters = [];
  List get savedFilters => _savedFilters;
  Map filtersMapSave(ElemFilter _obj) => localConverter().filtersToMap(_obj);

  void reload() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final List<int> _listPrice =
          Get_Lists(isApi: false, listTag: JsonTags.filterPrice)
              .getList()
              .cast<int>();
      int min = 0, max = 0;
      if (_listPrice.isNotEmpty) {
        min = _listPrice[0];
        max = _listPrice[1];
      }
      final List _listTime =
          Get_Lists(isApi: false, listTag: JsonTags.filterTime).getList();
      DDBEl dDTime=DDBEl(id: 0,value: "");
      if(_listTime.isNotEmpty){
        dDTime=_listTime[0];
      }
      RIBase.changeDate(
          RITags.rIMin, TextEditingController(text: min.toString()));
      RIBase.changeDate(
          RITags.rIMax, TextEditingController(text: max.toString()));

      _markObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterMark).getList();
      _modelObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterModel).getList();
      _colorObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterColor).getList();
      _etrapObjs =
          Get_Lists(isApi: false, listTag: JsonTags.filterEtrap).getList();
      _filters = {
        JsonTags.filterMark:
            Get_Lists(isApi: false, listTag: JsonTags.filterMark).getList(),
        JsonTags.filterModel:
            Get_Lists(isApi: false, listTag: JsonTags.filterModel).getList(),
        JsonTags.filterColor:
            Get_Lists(isApi: false, listTag: JsonTags.filterColor).getList(),
        JsonTags.filterEtrap:
            Get_Lists(isApi: false, listTag: JsonTags.filterEtrap).getList(),
        JsonTags.filterPrice: [min, max],
        JsonTags.filterTime: [dDTime]
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

  void changePrice(int min, int max) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _filters[JsonTags.filterPrice] = [min, max];
    });
    notifyListeners();
  }

  void changeTime(DDBEl _elem) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _filters[JsonTags.filterTime] = [_elem];
    });
    notifyListeners();
  }

  void tongleFilter(obj, String tag) {
    if (isExist(obj, tag)) {
      _filters[tag].remove(obj);
    } else {
      _filters[tag].add(obj);
    }
    notifyListeners();
  }

  void tongleAllFilter(List list, String tag, bool isAll) {
    if (isAll) {
      _filters[tag] = [];
    } else {
      list = list.where((obj) => !isExist(obj, tag)).toList();
      _filters[tag] += list;
    }
    notifyListeners();
  }

  void multiRemoweFilter(List list, String tag) {
    list.forEach((elementL) {
      _filters[tag] = _filters[tag]
          .where((elementF) => elementF.id != elementL.id)
          .toList();
    });
    notifyListeners();
  }

  bool isExist(obj, String tag) {
    bool _isExist = false;
    if (tag == JsonTags.filterPlace) {
      _isExist = ElemEtrap.pace_idList(_filters[JsonTags.filterEtrap])
          .contains(obj.id);
    } else {
      _isExist = Get_Lists.idList(_filters[tag]).contains(obj.id);
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

  void clearEtrap() {
    _etrapObjs = [];
    notifyListeners();
  }

  void clearAll() {
    _filters = {
      JsonTags.filterMark: [],
      JsonTags.filterModel: [],
      JsonTags.filterColor: [],
      JsonTags.filterEtrap: [],
      JsonTags.filterPrice: [0, 0],
      JsonTags.filterTime: [DDBEl(id: 0, value: "")],
    };
    notifyListeners();
  }
}
