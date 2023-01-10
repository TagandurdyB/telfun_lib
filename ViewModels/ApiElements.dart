import 'package:flutter/cupertino.dart';

class ElemImg {
  final String image;

  ElemImg({this.image});
}

class ElemPlace {
  final String name;
  final List etraps;
  final int id;
  ElemPlace({this.etraps, this.id, this.name});
}

class ElemEtrap {
  final String name;
  final int id,place_id;
  ElemEtrap({this.place_id,this.id, this.name});

  String shortName() {
    if (name.length > 10) {
      return name.substring(0, 10) + "...";
    }
    return name;
  }

  static List<int> pace_idList(List objList) {
    List<int> _list = objList.map((e) => e.place_id).toList().cast<int>();
    return _list;
  }

}

class ElemCategory {
  final String tm, image;
  final int id, count;
  ElemCategory({this.count, this.id, this.tm, this.image});
}

class ElemMark {
  final String name, image;
  final int id;

  ElemMark({this.image, this.id, this.name});
}

class ElemModel {
  final int category_id, mark_id, id;
  final String name;
  final List colors;
  ElemModel({this.name, this.colors, this.category_id, this.mark_id, this.id});
}

class ElemEvents {
  final int id, price, index, mark_id, category_id, view;
  bool favorite;
  final ElemColor color;
  final bool is_new, isVip;
  final DateTime data;
  final List images;
  final String name, phone, place, about,category, mark, public_image;
  final ElemEtrap etrap;
  //final List images;
  ElemEvents(
      {
        this.category="",
        this.isVip = false,
      this.etrap,
      this.view,
      this.color,
      this.mark_id,
      this.category_id,
      this.index = -1,
      this.favorite = false,
      this.is_new = false,
      this.data,
      this.price,
      this.phone,
      this.place,
      this.about,
      this.mark,
      this.images,
      this.id,
      this.name,
      this.public_image});
  void changeFavorite(bool _is) {
    favorite = _is;
  }

  List<int> idList(List objList) {
    List<int> _list = objList.map((e) => e.id).toList().cast<int>();
    return _list;
  }

  List<int> markIdList(List objList) {
    List<int> _list = objList.map((e) => e.mark_id).toList().cast<int>();
    return _list;
  }

  String shortName() {
    if (name.length > 19) {
      return name.substring(0, 19) + "...";
    }
    return name;
  }
}

class ElemColor {
  final int id;
  final String tm, ru, en, code, name;
  ElemColor({this.name, this.id, this.tm, this.ru, this.en, this.code});
  Color toColor() {
    int _code = int.parse("0xff${code.substring(1)}");
    return Color(_code);
  }
}

class ElemShop {
  final int id, user_id;
  final String name, phone, about;
  final List images;
  ElemShop(
      {this.user_id, this.phone, this.about, this.id, this.name, this.images});
  String shortAbout() {
    if (about.length > 40) return about.substring(0, 40) + "...";
    return about;
  }
}

class ElemFilter {
  final int id;
  final String name;
  ElemFilter({this.name, this.id});
}
