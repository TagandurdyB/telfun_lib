import 'package:flutter/material.dart';

class Elem {
  final int id;
  final String name;
  Elem({this.id, this.name});

  List<int> idList(List<Elem> objList) {
    List<int> _list = objList.map((e) => e.id).toList();
    return _list;
  }
}

class FavoriteProvider extends ChangeNotifier {
  List<Elem> _words = [];
  List<Elem> get words => _words;

  void tongleFavorite(Elem word) {
    if (isExist(word)) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  bool isExist(Elem word) {
    // final bool _isExist = _words.contains(word);
    final bool _isExist = Elem().idList(_words).contains(word.id);
    return _isExist;
  }

  void clearFavorite() {
    _words = [];
    notifyListeners();
  }
}
