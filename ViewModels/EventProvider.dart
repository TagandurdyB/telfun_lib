import 'package:flutter/cupertino.dart';
import '/ViewModels/ApiElements.dart';
import 'MapConverter.dart';
import 'Names.dart';

class EventsProvid extends ChangeNotifier {
  List _objs = Get_Lists(listTag: ApiTags.events).getList();
  List get objs => _objs;

  void changeEventList(List _list) {
    if (_list != null) _objs = _list;
    notifyListeners();
  }

/*  void tongleFavorite(ElemEvents obj) {
    if (isExist(obj)) {
      _objs.remove(obj);
    } else {
      _objs.add(obj);
    }
    notifyListeners();
  }*/
  List sortWithMarks(int mark_id) {
    List _list = _objs.where((element) => element.mark_id == mark_id).toList();
    return _list;
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

  void fillObjsWithFavorite(List _list) {
    if (_list != null) _objs = _list;
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
