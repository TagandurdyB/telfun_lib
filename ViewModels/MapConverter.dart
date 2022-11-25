import 'package:flutter/cupertino.dart';
import '/Models/Base.dart';
import 'ApiElements.dart';
import 'Names.dart';

class MapConverter {
  final String ApiName, JsonName;
  final List ElemList;
  final List MapList;
  MapConverter(
      {this.JsonName, this.ElemList, this.MapList, @required this.ApiName});

  String name() {
    if (ApiName == null && JsonName == null) {
      return "";
    } else if (ApiName != null && JsonName != null) {
      return "";
    } else if (ApiName != null) {
      return ApiName;
    } else if (JsonName != null) {
      return JsonName;
    }
  }

  List toElem() {
    String _name = name();
    List list = [];
    for (int i = 0; i < MapList.length; i++) {
      Map _val = MapList[i];
      if (_name == ApiTags.img) {
        list.add(localConverter().mapToElemImg(_val));
      } else if (_name == ApiTags.model) {
        list.add(localConverter().mapToElemModel(_val));
      } else if (_name == ApiTags.mark) {
        list.add(localConverter().mapToElemMark(_val));
      } else if (_name == ApiTags.detal) {
        list.add(localConverter().mapToElemEventDetal(_val));
      } else if (_name == ApiTags.events) {
        list.add(localConverter().mapToElemEvents(_val));
      } else if (_name == ApiTags.categori) {
        list.add(localConverter().mapToElemCategory(_val));
      }
    }
    return list;
  }

  List toMap() {
    List list = [];
    String _name = name();
    for (int i = 0; i < ElemList.length; i++) {
      if (_name == ApiTags.img) {
        list.add(localConverter().elemImgToMap(ElemList[i]));
      } else if (_name == ApiTags.categori) {
        list.add(localConverter().elemCategoryToMap(ElemList[i]));
      } else if (_name == ApiTags.events) {
        list.add(localConverter().elemEventsToMap(ElemList[i]));
      } else if (_name == ApiTags.detal) {
        list.add(localConverter().elemEventDetalToMap(ElemList[i]));
      } else if (_name == ApiTags.mark) {
        list.add(localConverter().elemMarkToMap(ElemList[i]));
      } else if (_name == ApiTags.model) {
        list.add(localConverter().elemModelToMap(ElemList[i]));
      }
    }
    return list;
  }

  List maptoMap() {
    List list = [];
    String _name = name();
    for (int i = 0; i < MapList.length; i++) {
      Map _val = MapList[i];
      if (_name == ApiTags.img) {
        list.add(localConverter().mapToMapImg(_val));
      } else if (_name == ApiTags.model) {
        list.add(localConverter().mapToMapModel(_val));
      } else if (_name == ApiTags.mark) {
        list.add(localConverter().mapToMapMark(_val));
      } else if (_name == ApiTags.detal) {
        list.add(localConverter().mapToMapEventDetal(_val));
      } else if (_name == ApiTags.events) {
        list.add(localConverter().mapToMapEvents(_val));
      } else if (_name == ApiTags.categori) {
        list.add(localConverter().mapToMapCategori(_val));
      }
    }
    return list;
  }
}

class localConverter {
  /////////////////////////////////////////////////////////////
  ElemImg mapToElemImg(Map _map) {
    try {
      return ElemImg(
        image: _map["image"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemImg!!! :$_e");
    }
  }

  Map elemImgToMap(ElemImg _elem) {
    try {
      return {
        "image": _elem.image,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemImgToMap!!! :$_e");
    }
  }

  Map mapToMapImg(Map _map) {
    try {
      return {
        "image": _map["image"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapImg!!! :$_e");
    }
  }

  /////////////////////////////////////////////////////////////
  ElemCategory mapToElemCategory(Map _map) {
    try {
      return ElemCategory(
        id: _map["id"],
        tm: _map["tm"],
        count: _map["count"],
        image: _map["image"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemCategory!!! :$_e");
    }
  }

  Map elemCategoryToMap(ElemCategory _elem) {
    try {
      return {
        "id": _elem.id,
        "tm": _elem.tm,
        "count": _elem.count,
        "image": _elem.image
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemCategoryToMap!!! :$_e");
    }
  }

  Map mapToMapCategori(Map _map) {
    try {
      return {
        "id": _map["id"],
        "tm": _map["tm"],
        "count": _map["count"],
        "image": _map["image"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapCategori!!! :$_e");
    }
  }

  /////////////////////////////////////////////////////////////
  ElemModel mapToElemModel(Map _map) {
    try {
      List<ElemColor> _colors = [];
      _map["color"].forEach((val) {
        _colors.add(mapToElemColor(val));
      });
      return ElemModel(
        category_id: int.parse(_map["category_id"]),
        mark_id: int.parse(_map["mark_id"]),
        colors: _colors,
        name: _map["name"],
        id: _map["id"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemModel!!! :$_e");
    }
  }

  Map elemModelToMap(ElemModel _elem) {
    try {
      List<Map> _colors = [];
      _elem.colors.forEach((elm) {
        _colors.add(elemColorToMap(elm));
      });
      for (int _i; _i < _elem.colors.length; _i++)
        _colors.add(elemColorToMap(_elem.colors[_i]));
      return {
        "category_id": _elem.category_id,
        "mark_id": _elem.mark_id,
        "color": _colors,
        "name": _elem.name,
        "id": _elem.id,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemModelToMap!!! :$_e");
    }
  }

  Map mapToMapModel(Map _map) {
    try {
      List<Map> _colors = [];
      _map["color"].forEach((val) {
        _colors.add(mapToMapColor(val));
      });
      return {
        "category_id": int.parse(_map["category_id"]).toString(),
        "mark_id": int.parse(_map["mark_id"]).toString(),
        "color": _colors,
        "name": _map["name"],
        "id": _map["id"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapModel!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemColor mapToElemColor(Map _map) {
    try {
      return ElemColor(
        id: _map["id"],
        tm: _map["tm"],
        ru: _map["ru"],
        code: _map["code"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemColor!!! :$_e");
    }
  }

  Map elemColorToMap(ElemColor _elem) {
    try {
      return {
        "id": _elem.id,
        "tm": _elem.tm,
        "ru": _elem.ru,
        "code": _elem.code,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemColorToMap!!! :$_e");
    }
  }

  Map mapToMapColor(Map _map) {
    try {
      return {
        "id": _map["id"],
        "tm": _map["tm"],
        "ru": _map["ru"],
        "code": _map["code"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapColor!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemEvents mapToElemEventDetal(Map _map) {
    try {
      return ElemEvents(
        data: DateTime.parse(_map["updated_at"]),
        images: _map["image"],
        name: _map["name"],
        price: int.parse(_map["price"]),
        place: _map["place"],
        phone: _map["user_phone"],
        mark: _map["mark"]["name"],
        about: _map["about"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemEventDetal!!! :$_e ");
    }
  }

  Map<String, dynamic> elemEventDetalToMap(ElemEvents _elem) {
    try {
      return {
        "data": _elem.data,
        "image": _elem.images,
        "name": _elem.name,
        "price": _elem.price,
        "place": _elem.place,
        "phone": _elem.phone,
        "mark": _elem.mark,
        "about": _elem.about,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemEventDetalToMap!!! :$_e");
    }
  }

  Map<String, dynamic> mapToMapEventDetal(Map _map) {
    try {
      return {
        "data": DateTime.parse(_map["updated_at"]),
        "images": _map["image"],
        "name": _map["name"],
        "price": int.parse(_map["price"]),
        "place": _map["place"],
        "phone": _map["user_phone"],
        "mark": _map["mark"]["name"],
        "about": _map["about"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapEventDetal!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemEvents mapToElemEvents(Map _map) {
    try {
      if (_map["is_new"] == null)
        return ElemEvents(
          data: DateTime.parse(_map["updated_at"]),
          id: _map["id"],
          name: _map["name"],
          //about: _map["about"],
          //  images: _map["image"],
          // mark: _map["mark"]["name"],
          // phone: _map["user"]["phone"],
          place: _map["place"],
          price: int.parse(_map["price"]),
          public_image: _map["public_image"],
        );
      else if (_map["is_new"])
        return ElemEvents(
          is_new: true,
          data: DateTime.parse(_map["updated_at"]),
          id: _map["products_id"],
          name: _map["product"]["name"],
          //about: _map["about"],
          //  images: _map["image"],
          // mark: _map["mark"]["name"],
          // phone: _map["user"]["phone"],
          place: _map["place"],
          price: int.parse(_map["price"]),
          public_image: _map["product"]["public_image"],
        );
      else
        return ElemEvents(
          is_new: false,
          data: DateTime.parse(_map["updated_at"]),
          id: _map["id"],
          name: _map["name"],
          //about: _map["about"],
          //  images: _map["image"],
          // mark: _map["mark"]["name"],
          // phone: _map["user"]["phone"],
          place: _map["place"],
          price: int.parse(_map["price"]),
          public_image: _map["public_image"],
        );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemEvents!!! :$_e");
    }
  }

  Map elemEventsToMap(ElemEvents _elem) {
    // return {"image": _elem.image};
    try {
      if (!_elem.is_new)
        return {
          "data": _elem.data,
          "id": _elem.id,
          "name": _elem.name,
          // "about": _elem.about,
          //  "images": _elem.images,
          "mark": _elem.mark,
          "phone": _elem.phone,
          "place": _elem.place,
          "price": _elem.price,
          "public_image": _elem.public_image,
        };
      else
        return {
          "is_new": true,
          "data": _elem.data,
          "id": _elem.id,
          "name": _elem.name,
          // "about": _elem.about,
          //  "images": _elem.images,
          // "mark": _elem.mark,
          // "phone": _elem.phone,
          "place": _elem.place,
          "price": _elem.price,
          "public_image": _elem.public_image,
        };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemEventsToMap!!! :$_e");
    }
  }

  Map mapToMapEvents(Map _map) {
    // return {"image": _elem.image};
    try {
      if (!_map["is_new"])
        return {
          "data": DateTime.parse(_map["updated_at"]),
          "id": _map["id"],
          "name": _map["name"],
          //"about": _map["about"],
          //  "images": _map["image"],
          "mark": _map["mark"]["name"],
          "phone": _map["user"]["phone"],
          "place": _map["place"],
          "price": int.parse(_map["price"]),
          "public_image": _map["public_image"],
        };
      else
        return {
          "is_new": true,
          "data": DateTime.parse(_map["updated_at"]),
          "id": _map["products_id"],
          "name": _map["product"]["name"],
          //"about": _map["about"],
          //  "images": _map["image"],
          // "mark": _map["mark"]["name"],
          // "phone": _map["user"]["phone"],
          "place": _map["place"],
          "price": int.parse(_map["price"]),
          "public_image": _map["product"]["public_image"],
        };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapEvents!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemMark mapToElemMark(Map _map) {
    try {
      return ElemMark(
        image: _map["image"],
        id: _map["id"],
        name: _map["name"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemMark!!! :$_e");
    }
  }

  Map elemMarkToMap(ElemMark _elem) {
    try {
      return {
        "image": _elem.image,
        "id": _elem.id,
        "name": _elem.name,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemMarkToMap!!! :$_e");
    }
  }

  Map mapToMapMark(Map _map) {
    try {
      return {
        "image": _map["image"],
        "id": _map["id"],
        "name": _map["name"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapMark!!! :$_e");
    }
  }
/////////////////////////////////////////////////////////////
}

class Get_Lists {
  final String listTag;
  final bool isApi;

  Get_Lists({@required this.listTag, this.isApi = true});

  List getList() {
    return Base(isAPI: isApi).get()[listTag];
  }
}
