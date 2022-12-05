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
      } else if (_name == ApiTags.events||_name==ApiTags.all||_name == ApiTags.product||_name==ApiTags.prosses) {
        list.add(localConverter().mapToElemEvents(_val));
      } else if (_name == ApiTags.categori) {
        list.add(localConverter().mapToElemCategory(_val));
      } else if (_name == ApiTags.place) {
        list.add(localConverter().mapToElemPlace(_val));
      } else if (_name == JsonTags.favorite) {
        list.add(localConverter().mapToFavorite(_val));
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
      } else if (_name == ApiTags.events||_name==ApiTags.all||_name == ApiTags.product||_name==ApiTags.prosses) {
        list.add(localConverter().elemEventsToMap(ElemList[i]));
      } else if (_name == ApiTags.detal) {
        list.add(localConverter().elemEventDetalToMap(ElemList[i]));
      } else if (_name == ApiTags.mark) {
        list.add(localConverter().elemMarkToMap(ElemList[i]));
      } else if (_name == ApiTags.model) {
        list.add(localConverter().elemModelToMap(ElemList[i]));
      } else if (_name == ApiTags.place) {
        list.add(localConverter().elemPlaceToMap(ElemList[i]));
      } else if (_name == JsonTags.favorite) {
        list.add(localConverter().favoriteToMap(ElemList[i]));
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
        // print("Map Model:${localConverter().mapToMapModel(_val)}");
      } else if (_name == ApiTags.mark) {
        list.add(localConverter().mapToMapMark(_val));
      } else if (_name == ApiTags.detal) {
        list.add(localConverter().mapToMapEventDetal(_val));
      } else if (_name == ApiTags.events||_name==ApiTags.all||_name == ApiTags.product||_name==ApiTags.prosses) {
        list.add(localConverter().mapToMapEvents(_val));
      } else if (_name == ApiTags.categori) {
        list.add(localConverter().mapToMapCategori(_val));
      } else if (_name == ApiTags.place) {
        list.add(localConverter().mapToMapPlace(_val));
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
  ElemPlace mapToElemPlace(Map _map) {
    try {
      List<ElemEtrap> _etraps = [];
      _map["etraps"].forEach((val) {
        _etraps.add(mapToElemEtrap(val));
      });
      return ElemPlace(
        name: _map["name"],
        id: _map["id"],
        etraps: _etraps,
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemPlace!!! :$_e");
    }
  }

  Map elemPlaceToMap(ElemPlace _elem) {
    try {
      List<Map> _etraps = [];
      _elem.etraps.forEach((elm) {
        _etraps.add(elemEtrapToMap(elm));
      });
      for (int _i; _i < _elem.etraps.length; _i++)
        _etraps.add(elemEtrapToMap(_elem.etraps[_i]));
      return {
        "name": _elem.name,
        "id": _elem.id,
        "etraps": _etraps,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemPlaceToMap!!! :$_e");
    }
  }

  Map mapToMapPlace(Map _map) {
    try {
      List<Map> _etraps = [];
      _map["etrap"].forEach((val) {
        _etraps.add(mapToMapEtrap(val));
      });

      return {
        "name": _map["name"],
        "id": _map["id"],
        "etraps": _etraps,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapPlace!!! :$_e");
    }
  }

  /////////////////////////////////////////////////////////////
  ElemEtrap mapToElemEtrap(Map _map) {
    try {
      return ElemEtrap(
        id: _map["id"],
        name: _map["name"],
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemEtrap!!! :$_e");
    }
  }

  Map elemEtrapToMap(ElemEtrap _elem) {
    try {
      return {
        "id": _elem.id,
        "name": _elem.name,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemEtrapToMap!!! :$_e");
    }
  }

  Map mapToMapEtrap(Map _map) {
    try {
      return {
        "id": _map["id"],
        "name": _map["name"],
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapEtrap!!! :$_e");
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
        color: ElemColor(
            id: _map["color"]["id"],
            tm: _map["color"]["tm"],
            code: _map["color"]["code"].toString(),
            ru: _map["color"]["ru"]),
        is_new: _map["is_new"],
        data: DateTime.parse(_map["data"]),
        images: _map["images"],
        name: _map["name"],
        price: int.parse(_map["price"]),
        place: _map["place"].toString(),
        phone: _map["phone"],
        mark: _map["mark"],
        about: _map["about"],
      );
    } catch (_e) {
      print("is_new:${_map["is_new"]}");
      print("data:${_map["data"]}");
      print("color:${_map["color"]}");
      print("name:${_map["name"]}");
      print("price:${_map["price"]}");
      print("place:${_map["place"]}");
      print("phone:${_map["phone"]}");
      print("mark:${_map["mark"]}");
      print("about:${_map["about"]}");
      print("+Convet_ERROR+: Be error from mapToElemEventDetal!!! :$_e ");
    }
  }

  Map<String, dynamic> elemEventDetalToMap(ElemEvents _elem) {
    try {
      return {
        "color": {
          "id": _elem.color.id,
          "tm": _elem.color.tm,
          "ru": _elem.color.ru,
          "code": _elem.color.code
        },
        "is_new": _elem.is_new,
        "data": _elem.data.toString(),
        "image": _elem.images,
        "name": _elem.name,
        "price": _elem.price.toString(),
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
      if (_map["is_new"] == 0)
        return {
          "is_new": false,
          "data": _map["updated_at"],
          "images": _map["image"],
          "color": {"code": "#ff0000", "tm": "", "ru": "", "id": 0},
          "name": _map["name"],
          "price": _map["price"].toString(),
          "place": _map["welayat"],
          "phone": _map["user_phone"],
          "mark": _map["mark"]["name"],
          "about": _map["about"],
        };
      else {
        return {
          "is_new": true,
          "color": {
            "tm":_map["color"]["tm"],
            "ru":_map["color"]["ru"],
            "id":_map["color"]["id"],
            "code":_map["color"]["code"],
          },
          "data": _map["updated_at"],
          "images": _map["image"],
          "name": _map["name"],
          "price": _map["price"].toString(),
          "place": _map["welayat"],
          "phone": _map["user_phone"],
          "mark": _map["mark"]["name"] /*_map["mark"]["name"]*/,
          "about": _map["about"],
        };
      }
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToMapEventDetal!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemEvents mapToElemEvents(Map _map) {
    try {
      return ElemEvents(
        data: DateTime.parse(_map["data"]),
        id: _map["id"],
        name: _map["name"],
        mark_id: int.parse(_map["mark_id"]),
        is_new: _map["is_new"],
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
    try {
      return {
        "data": _elem.data.toString(),
        "id": _elem.id,
        "name": _elem.name,
        "mark_id": _elem.mark_id.toString(),
        "is_new": _elem.is_new,
        // "about": _elem.about,
        //  "images": _elem.images,
        //"mark": _elem.mark,
        // "phone": _elem.phone,
        "place": _elem.place,
        "price": _elem.price.toString(),
        "public_image": _elem.public_image,
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from elemEventsToMap!!! :$_e");
    }
  }

  Map mapToMapEvents(Map _map) {
    try {
      return {
        "data": _map["updated_at"],
        "id": _map["id"],
        "name": _map["name"],
        "mark_id": _map["mark_id"],
        "is_new": _map["is_new"] == 1 ? true : false,
        //about: _map["about"],
        //  images: _map["image"],
        // mark: _map["mark"]["name"],
        // phone: _map["user"]["phone"],
        "place": _map["welayat"],
        "price": _map["price"],
        "public_image": _map["public_image"],
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

  ElemEvents mapToFavorite(Map _map) {
    try {
      return ElemEvents(
        is_new: _map["is_new"],
        id: _map["id"],
        data: DateTime.parse(_map["data"]),
        place: _map["place"],
        price: int.parse(_map["price"]),
        public_image: _map["public_image"],
        name: _map["name"],
        index: _map["index"],
        favorite: true,
        //favorite: true
      );
    } catch (_e) {
      print("+Convet_ERROR+: Be error from mapToFavorite!!! :$_e");
    }
  }

  Map favoriteToMap(ElemEvents _elem) {
    try {
      return {
        "is_new":_elem.is_new,
        "id": _elem.id,
        "data": _elem.data.toString(),
        "place": _elem.place,
        "price": _elem.price.toString(),
        "public_image": _elem.public_image,
        "name": _elem.name,
        "index": _elem.index,
        "favorite": true,
        //"favorite": true
      };
    } catch (_e) {
      print("+Convet_ERROR+: Be error from favoriteToMap!!! :$_e");
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
