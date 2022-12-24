import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telfun/Models/ChatElement.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/Models/Base.dart';
import '/Models/Cacher.dart';
import '/Models/connect.dart';
import '/Models/ApiService.dart';
import 'MapConverter.dart';
import 'ShPBDebug.dart';

//APILists ApiList;
const String IP = "https://it.net.tm/telfun";

class API_Get extends StatelessWidget {
  final String URL;
  final Widget Return;
  final String ApiName;
  final Map Post;
  // final int LIndex;
  API_Get(
      {Key key,
      @required this.URL,
      @required this.Return,
      @required this.ApiName,
      this.Post
      // @required this.LIndex,
      })
      : super(key: key);

  void addBase(List _list) {
    Base().add(
        {ApiName: MapConverter(ApiName: ApiName, MapList: _list).toElem()});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: API(url: URL).getDate(ApiName),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
            return FutureBuilder<bool>(
                future: isConnected(),
                builder: (context, snapsh) {
                  if (snapsh.hasError) {
                    print("Error ******+*");
                  }
                  if (snapsh.hasData) {
                    if (snapsh.data) {
                      List _mapL =
                          MapConverter(ApiName: ApiName, MapList: ss.data)
                              .maptoMap();
                      addBase(_mapL);
                      String _body = jsonEncode(_mapL);
                      Cacher.writeJson(ApiName, _body);
                    } else {
                      addBase(ss.data);
                    }
                    return Return;
                  } else {
                    return loadingApi();
                  }
                });
          } else {
            return loadingApi();
          }
        });
  }

  Widget loadingApi() {
    return Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeProvided().colorCanvas,
              /* gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.white,
                  Color(0xff6911B0),
                  Colors.white
                ] */ /*[Colors.yellow, Color(0xff6911B0), Colors.red]*/ /*)*/
            ),
            child: Container(child: CircularProgressIndicator())));
  }
}

class Get_apiStream extends StatelessWidget {
  final String URL;
  final Widget Return;
  final String ApiName;
  // final int LIndex;
  const Get_apiStream({
    Key key,
    @required this.URL,
    @required this.Return,
    @required this.ApiName,
    // @required this.LIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final stream = API(url: URL).getDateStream();
    return StreamBuilder(
        stream: stream,
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
            //  print("++++++++++++++++++++++++++++++Snapshot:${ss.data}");
            // ApiBase[ApiName]=ss.data;
            print(
                "+*+*+*Convert:${MapConverter(ApiName: ApiName, MapList: ss.data).toElem()}");
            //  ApiBase.addAll({ApiName: ApiConverter(ApiName: ApiName,MapList: ss.data).toElem()});
            return Return;
          } else {
            return Center(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff6911B0),
                      /*gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.yellow,Color(0xff6911B0), Colors.red])*/
                    ),
                    child: Container(child: CircularProgressIndicator())));
          }
        });
  }
}

class Get_Me {
  final String URL, token;

  Get_Me({this.URL, this.token});
  check() async {
    var ss = await API(url: URL).getBerarer(token);
    print("isban: ${ss["isban"]}");
    return ss["isban"];
  }
}

class API_Post {
  final String URL;
  final Map body;

  API_Post({this.body,
      @required this.URL,
/*      @required this.name,
      @required this.phone,
      @required this.pass*/});

  //if you aren't in base then send firebase sms
  Future<bool> IsRegister() async {
    Map<String, dynamic> map =
        await API(url: URL).Register(body);
    return map["status"];
    print("+++*** $map");
  }

  void SaveUserDet(Map<String, dynamic> _map) {
    ShPUser(
            id: _map["user"]["id"],
            name: _map["user"]["name"],
            phone: _map["user"]["phone"],
            isban: _map["user"]["isban"],
            token: _map["access_token"])
        .sava();
  }

  //if sms code true you are login

  void addRegister() async {
    Map<String, dynamic> map =
        await API(url: URL).post(body);
    print("+++*** $map");
    UserLoginDetals.saveLogin(map["status"]);
    print("***${UserLoginDetals.getIsLogin()}");
    if (map["status"]) {
      SaveUserDet(map);
    }
  }

  Future<bool> IsLogin() async {
    Map<String, dynamic> map = await API(url: URL).Login(body);
    print("+++*** $map");
    UserLoginDetals.saveLogin(map["status"]);
    if (map["status"]) {
      SaveUserDet(map);
    } else {
      ShPUser().erase();
    }
    return map["status"];
  }

  Future<bool> sendSMS(String _message) async {
    Map<String, dynamic> map = await API(url: URL).post({
      "name": UserProperties.getProperty("name"),
      "email": "User${UserProperties.getProperty("name")}@gmail.com",
      "phone": "${UserProperties.getProperty("phone")}",
      "text": _message,
    });
    return map["status"];
    print("+++*** $map");
  }

/*  Future<bool> shop_add(Map _message) async {
    Map<String, dynamic> map = await API(URL: URL).POST({

    });
    return map["status"];
    print("+++*** $map");
  }*/
}
