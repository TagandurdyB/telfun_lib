import 'package:flutter/cupertino.dart';
import 'package:telfun/Models/connect.dart';
import 'package:telfun/Views/widgets/AddImg.dart';
import 'ApiElements.dart';
import 'Names.dart';

class ApiConverter {
  final String ApiName;
  final List ElemList;
  final List MapList;
  ApiConverter({this.ElemList, this.MapList, @required this.ApiName});

  List toElem() {
    List list=[];
    for (int i=0;i<MapList.length;i++) {
      Map _val=MapList[i];
      if (ApiName == ApiTags.img) {
        list.add(localConverter().mapToElemImg(_val));
      }
      if (ApiName == ApiTags.model) {
        list.add(localConverter().mapToElemModel(_val));
      }
      if (ApiName == ApiTags.mark) {
        list.add(localConverter().mapToElemMark(_val));
      }
      if (ApiName == ApiTags.eventDetal) {
        list.add(localConverter().mapToElemEventDetal(_val));
      }
      if (ApiName == ApiTags.events) {
        list.add(localConverter().mapToElemEvents(_val));
      }
      if (ApiName == ApiTags.categori) {
        list.add(localConverter().mapToElemCategory(_val));
      }
    }
    return list;
  }

  List toMap() {
    List list;
    for (int i = 0; i < ElemList.length; i++) {
      if (ApiName == ApiTags.img) {
        list.add(localConverter().elemImgToMap(ElemList[i]));
      } else if (ApiName == ApiTags.categori) {
        list.add(localConverter().elemCategoryToMap(ElemList[i]));
      } else if (ApiName == ApiTags.events) {
        list.add(localConverter().elemEventsToMap(ElemList[i]));
      } else if (ApiName == ApiTags.eventDetal) {
        list.add(localConverter().elemEventDetalToMap(ElemList[i]));
      } else if (ApiName == ApiTags.mark) {
        list.add(localConverter().elemMarkToMap(ElemList[i]));
      } else if (ApiName == ApiTags.model) {
        list.add(localConverter().elemModelToMap(ElemList[i]));
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
    }catch (_e) {
     print("+Convet_ERROR+: Be error from elemImgToMap!!! :$_e");
   }

  }

  /////////////////////////////////////////////////////////////
  ElemCategory mapToElemCategory(Map _map) {
    try{
      return ElemCategory(
        id: _map["id"],
        tm: _map["tm"],
        count: _map["count"],
        image: _map["image"],
      );
    }catch (_e) {
      print("+Convet_ERROR+: Be error from mapToElemCategory!!! :$_e");
    }
  }

  Map elemCategoryToMap(ElemCategory _elem) {
    try{
      return {
        "id": _elem.id,
        "tm": _elem.tm,
        "count":_elem.count,
        "image":_elem.image
      };
    }catch (_e){
      print("+Convet_ERROR+: Be error from elemCategoryToMap!!! :$_e");
    }
  }

  /////////////////////////////////////////////////////////////
  ElemModel mapToElemModel(Map _map) {
    try{
/*
String category_id,mark_id
int id
 */
      return ElemModel(
        category_id: int.parse(_map["category_id"]),
        mark_id: int.parse(_map["mark_id"]),
        colors: _map["color"],
        name: _map["name"],
        id: _map["id"],
      );
    }catch (_e){
      print("+Convet_ERROR+: Be error from mapToElemModel!!! :$_e");
    }
  }

  Map elemModelToMap(ElemModel _elem) {
    try{
      return {
        "category_id": _elem.category_id,
        "mark_id": _elem.mark_id,
        "colors": _elem.colors,
        "name":_elem.name,
        "id":_elem.id,
      };
    }catch (_e){
      print("+Convet_ERROR+: Be error from elemModelToMap!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemEventDetal mapToElemEventDetal(Map _map) {
    /*  final List image;
  final String name,mark,place,about,phone;
  final int price;*/
    try{
      return ElemEventDetal(
        images: _map["image"],
        name:_map["name"],
        price: int.parse(_map["price"]),
        place: _map["place"],
        phone: _map["user_phone"],
        mark: _map["mark"]["name"],
        about: _map["about"],
      );
    }catch (_e){
      print("+Convet_ERROR+: Be error from mapToElemEventDetal!!! :$_e");
    }
  }

  Map<String,dynamic> elemEventDetalToMap(ElemEventDetal _elem) {
    try{
      return {
        "image": _elem.images,
        "name":_elem.name,
        "price": _elem.price,
        "place": _elem.place,
        "phone": _elem.phone,
        "mark": _elem.mark,
        "about": _elem.about,
      };
    }catch (_e){
      print("+Convet_ERROR+: Be error from elemEventDetalToMap!!! :$_e");
    }
  }

/////////////////////////////////////////////////////////////
  ElemEvents mapToElemEvents(Map _map) {
    // return ElemImg(image: _map["image"]);
    try{
     return ElemEvents(
       id: _map["id"],
       name: _map["name"],
       about: _map["about"],
     //  images: _map["image"],
       mark: _map["mark"]["name"],
       phone: _map["user"]["phone"],
       place: _map["place"],
       price: int.parse(_map["price"]),
       public_image: _map["public_image"],
     );
    }catch (_e){
      print("+Convet_ERROR+: Be error from mapToElemEvents!!! :$_e");
    }
  }

  Map elemEventsToMap(ElemEvents _elem) {
    // return {"image": _elem.image};
    try{
    return {
      "id": _elem.id,
      "name": _elem.name,
      "about": _elem.about,
    //  "images": _elem.images,
      "mark": _elem.mark,
      "phone": _elem.phone,
      "place": _elem.place,
      "price": _elem.price,
      "public_image":_elem.public_image,
    };
    }catch (_e){
      print("+Convet_ERROR+: Be error from elemEventsToMap!!! :$_e");
    }
  }
/////////////////////////////////////////////////////////////
  ElemMark mapToElemMark(Map _map) {
    try{
      return ElemMark(
        image: _map["image"],
        id: _map["id"],
        name: _map["name"],
      );
    }catch (_e){
      print("+Convet_ERROR+: Be error from mapToElemMark!!! :$_e");
    }
  }

  Map elemMarkToMap(ElemMark _elem) {
    try{
      return {
        "image": _elem.image,
        "id": _elem.id,
        "name": _elem.name,
      };
    }catch (_e){
      print("+Convet_ERROR+: Be error from elemMarkToMap!!! :$_e");
    }
  }
/////////////////////////////////////////////////////////////
}


class Get_Lists {
  final String apiName;

  Get_Lists({@required this.apiName});

  List getList() {
    return ApiBase[apiName];
  }
}