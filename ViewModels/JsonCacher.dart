import 'dart:convert';

import 'package:telfun/ViewModels/Names.dart';

import '/Models/ApiService.dart';
import 'ApiConverter.dart';

class JsonListCacher {
  final String jsonName;
  JsonListCacher({this.jsonName});

  void save(List list) {
    API().writeJson(jsonName, list.toString());
  }

  void load() {
     List _list=json.decode(API().readJson(jsonName));
     print("asasas+++++:$_list");
     if(_list==null){

     }
    /* ApiBase.addAll({jsonName:_list});
     ApiConverter(ApiName: jsonName,ElemList: Get_Lists(apiName: JsonName.favorite).getList());*/
  }
}
