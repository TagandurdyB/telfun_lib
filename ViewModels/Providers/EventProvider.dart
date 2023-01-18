import 'package:flutter/cupertino.dart';
import 'package:telfun/Models/Public.dart';
import '/ViewModels/ApiElements.dart';
import '../MapConverter.dart';
import '../Names.dart';

class EventsProvid extends ChangeNotifier {
  List _objs = Get_Lists(listTag: ApiTags.events).getList();
  List get objs => _objs;
  List _markObjs = Get_Lists(listTag: ApiTags.mark).getList();
  List get markObjs => _markObjs;

  void reLoad() {
    _objs = Get_Lists(listTag: ApiTags.events).getList();
    notifyListeners();
  }
  void fillMark(){
    _markObjs = Get_Lists(listTag: ApiTags.mark).getList();
    notifyListeners();
  }

  List searchWithMarks(String _searchText) {
    List _list=[];
    if (_searchText != "") {
      print("I am in SortProvider :$_searchText");
      List _searchList = [];
      _list=_markObjs;
      for (int i = 0; i < _list.length; i++) {
        var name = _list[i];
        if (name.name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList;
    }
    return _markObjs;
  }


  List sortWithMarks(int mark_id, int sortNum, String _searchText) {
    List _list;
    if (mark_id == 0)
      _list = _objs;
    else
      _list = _objs.where((element) => element.mark_id == mark_id).toList();
    if (sortNum == 1) {
      _list.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortNum == 2) {
      _list.sort((a, b) => a.price.compareTo(b.price));
      _list = _list.reversed.toList();
    } else {
      _list.sort((a, b) => a.data.compareTo(b.data));
      _list = _list.reversed.toList();
    }
    if (_searchText != "") {
      print("I am in SortProvider :$_searchText");
      List _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        ElemEvents name = _list[i];
        if (name.name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      _list=_searchList;
    }
    final List _listVip=_list.where((element) => element.isVip).toList();
    _list=_list.where((element) => !element.isVip).toList();
    //_list=_list.reversed.toList();
    return _listVip+_list;
  }


  bool isExist(int id) {
    final bool _isExist = ElemEvents().idList(_objs).contains(id);
    return _isExist;
  }

  void clearFavorite() {
    _objs = [];
    notifyListeners();
  }
}

class EventsFavoritProvid extends ChangeNotifier {
  List _objs = Get_Lists(isApi: false, listTag: JsonTags.favorite).getList();
  List get objs => _objs;

  void reload() {
    _objs = Get_Lists(isApi: false, listTag: JsonTags.favorite).getList();
    notifyListeners();
  }

  void tongleFavorite(ElemEvents obj) {
    if (isExist(obj)) {
      _objs.remove(obj);
    } else {
      _objs.add(obj);
    }
    notifyListeners();
  }

  bool isExist(ElemEvents obj) {
    final bool _isExist = ElemEvents().idList(_objs).contains(obj.id);
    return _isExist;
  }

  void clearFavorite() {
    _objs = [];
    notifyListeners();
  }
}
