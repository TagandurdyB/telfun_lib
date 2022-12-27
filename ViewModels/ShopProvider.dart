import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';

class ShopProvider extends ChangeNotifier{
  List _objs=Get_Lists(listTag: ApiTags.shops).getList();
  List get objs=>_objs;

  void reLoad() {
    _objs = Get_Lists(listTag: ApiTags.shops).getList();
    notifyListeners();
  }

  List searchName(String _searchText) {
    List _list=[];
    if (_searchText != "") {
      print("I am in SortProvider :$_searchText");
      List _searchList = [];
      _list=_objs;
      for (int i = 0; i < _list.length; i++) {
        var name = _list[i];
        if (name.name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList;
    }
    return _objs;
  }

}