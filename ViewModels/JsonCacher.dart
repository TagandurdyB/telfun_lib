import 'dart:convert';
import 'dart:io';
import 'package:telfun/Models/Base.dart';
import 'package:telfun/ViewModels/Names.dart';

import '/Models/Cacher.dart';
import 'MapConverter.dart';

class JsonListCacher {
  final String jsonName;
  JsonListCacher({this.jsonName});

  void save(List list) {
    Cacher.writeJson(jsonName, jsonEncode(list));
  }

  void addBase(List _list) {
    Base(isAPI: false).add(
        {jsonName: MapConverter(JsonName: jsonName, MapList: _list).toElem()});
  }

  Future<bool> addSaved(Map _map) async {
    bool _added;
    List _list = await load();
    if (_list.isEmpty) {
      _list.add(_map);
      save(_list);
      addBase(_list);
      _added = true;
    } else {
      bool _canAdd = true;
      for (int i = 0; i < _list.length; i++) {
        if (_list[i]["id"] == _map["id"]) {
          _canAdd = false;
          break;
        }
      }
      if (_canAdd) {
        _list.add(_map);
        save(_list);
        addBase(_list);
        _added = true;
      } else {
        _added = false;
      }
      return _added;
    }
  }

  Future<bool> multiAddSaved(List _mapList) async {
    bool _added;
    List _list = await load();
    if (_list.isEmpty) {
      save(_mapList);
      addBase(_mapList);
      _added = true;
    } else {
      bool _canAdd = false;
      _list.forEach((element) {
        _mapList = _mapList
            .where((elementM) => elementM["id"] != element["id"])
            .toList();
      });
      if (_mapList.isNotEmpty) _canAdd = true;

      if (_canAdd) {
        List _result =_list + _mapList;
        save(_result);
        addBase(_result);
        _added = true;
      } else {
        _added = false;
      }
    }
    return _added;
  }

  Future<bool> removeSaved(Map _map) async {
    bool _removed;
    List _list = await load();
    if (_list.isEmpty) {
      _removed = false;
    } else {
      bool _canRemove = false;
      int _index;
      for (int i = 0; i < _list.length; i++) {
        if (_list[i]["id"] == _map["id"]) {
          _canRemove = true;
          _index = i;
          break;
        }
      }
      if (_canRemove) {
        _list.removeAt(_index);
        save(_list);
        addBase(_list);
        _removed = true;
      } else
        _removed = false;
    }
    return _removed;
  }

  Future<bool> multiRemoveSaved(List _mapList) async {
    bool _removed;
    List _list = await load();
    if (_list.isEmpty) {
      _removed = false;
    } else {
      bool _canRemove = false;
      int _firstListLength = _list.length;

      _mapList.forEach((element) {
        _list =
            _list.where((elementL) => elementL["id"] != element["id"]).toList();
      });

      if (_firstListLength != _list.length) _canRemove = true;

      if (_canRemove) {
        save(_list);
        addBase(_list);
        _removed = true;
      } else
        _removed = false;
    }
    return _removed;
  }

  Future<bool> removeAllSaved() async {
    bool _removed = false;
    save([]);
    _removed = true;
    return _removed;
  }

  Future<List> load() async {
    File file = await Cacher.getDirectory(jsonName);
    List _result = [];
    if (file.existsSync()) {
      List _list = await Cacher.readJson(jsonName);
      print("Loading Finished Sucsses!");
      _result = _list;
    } else {
      print("Saved Json!");
      save([]);
      _result = [];
    }
    return _result;
  }

  Future getDate() async {
    return await load();
  }
}
