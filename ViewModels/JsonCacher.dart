import 'dart:convert';
import 'dart:io';
import '/Models/Cacher.dart';

class JsonListCacher {
  final String jsonName;
  JsonListCacher({this.jsonName});

  void save(List list) {
    Cacher.writeJson(jsonName, list.toString());
  }

  Future<bool> addSaved(Map _map) async {
    print("FavoriteBtn add:$_map");
    bool _added;
    print("i em hear 1 +++");
    List<Map> _list = await load();
    print("i em hear 2 +++");
    if (_list.isEmpty) {
      print("isEmpety +++");
      _list.add(_map);
      save(_list);
      _added = true;
    } else {
      print("Else +++");
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
        _added = true;
      } else
        _added = false;
      return _added;
    }
  }

  Future<bool> removeSaved(Map _map) async {
    print("FavoriteBtn remove:$_map");
    bool _removed;
    List<Map> _list = await load();
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
        _removed = true;
      } else
        _removed = false;
    }
    return _removed;
  }

  Future<List<Map>> load() async {
    print("I am hear 3");
    File file = await Cacher.getDirectory(jsonName);
    List<Map> _result;
    print("I am hear 4");
    if (file.existsSync()) {
      print("I am hear 5");
      List _list = await Cacher.readJson(jsonName);
      print("readJson:+++++:$_list");
      _result=_list;
    }else{
      print("I am hear 6");
      print("seve+++:");
      save([]);
      _result=[];
    }
    return _result;
  }

  Future getDate() async{
    return await load();
  }
}
