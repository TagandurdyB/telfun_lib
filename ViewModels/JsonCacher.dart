import 'dart:convert';
import 'dart:io';
import 'package:telfun/Models/Base.dart';

import '/Models/Cacher.dart';
import 'MapConverter.dart';

class JsonListCacher {
  final String jsonName;
  JsonListCacher({this.jsonName});

  void save(List list) {
    Cacher.writeJson(jsonName, jsonEncode(list));
  }

  void addBase(List _list){
    Base(isAPI: false).add({
      jsonName:
      MapConverter(JsonName: jsonName, MapList:_list).toElem()
    });
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
      } else{
        _added = false;
       }
      return _added;
    }
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

  Future<List> load() async {
    File file = await Cacher.getDirectory(jsonName);
    List _result=[];
    if (file.existsSync()) {
      List _list = await Cacher.readJson(jsonName);
      print("Loading Finished Sucsses!");
      _result=_list;
    }else{
      print("Saved Json!");
      save([]);
      _result=[];
    }
    return _result;
  }

  Future getDate() async{
    return await load();
  }
}
