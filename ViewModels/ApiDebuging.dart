import 'dart:io';

import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import '../Views/LogoPage.dart';
import '/Models/connect.dart';
import 'ShPBDebug.dart';

//APILists ApiList;
const String IP = "https://it.net.tm/telfun";

class Get_api extends StatelessWidget {
  final String URL;
  final Widget Return;
  final String ApiName;
  final Map Post;
  // final int LIndex;
  Get_api({
    Key key,
    @required this.URL,
    @required this.Return,
    @required this.ApiName,
     this.Post
    // @required this.LIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //fillFile();
    return FutureBuilder<List>(
        future: API(URL:URL,Post:Post).getDate(ApiName),
        builder: (ctx, ss) {
          if (ss.hasError) {
         //   print("+++${ss}");
            print("Error Fail***");
          }
          if (ss.hasData) {
            // ApiBase[ApiName]=ss.data;
            // API(URL).localSave(ApiName,ss.data);
            // API(URL).localLoad(ApiName);
            ApiBase.addAll({ApiName: ss.data});
            return Return;
          } else {
            return Center(
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        //color: Colors.red,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.yellow,Color(0xff6911B0), Colors.red])),
                    child: Container(child: CircularProgressIndicator())));
          }
        });
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
    final stream = API(URL:URL).getDateStream();
    return StreamBuilder(
        stream: stream,
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
            print("++++++++++++++++++++++++++++++Snapshot:${ss.data}");
            // ApiBase[ApiName]=ss.data;
            ApiBase.addAll({ApiName: ss.data});
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
                            colors: [Colors.yellow,Color(0xff6911B0), Colors.red])*/),
                    child: Container(child: CircularProgressIndicator())));
          }
        });
  }
}

class Get_Me {
  final String URL, token;

  Get_Me({this.URL, this.token});
  check() async {
    var ss = await API(URL:URL).getBerarer(token);
    print("isban: ${ss["isban"]}");
    return ss["isban"];
  }
}

class Post_Api {
  final String URL, name, phone, pass;

  Post_Api(
      {@required this.URL,
      @required this.name,
      @required this.phone,
      @required this.pass});

  //if you aren't in base then send firebase sms
  Future<bool> IsRegister() async {
    Map<String, dynamic> map = await API(URL:URL).Register([name, phone, pass]);
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
    Map<String, dynamic> map = await API(URL:URL).Register([name, phone, pass]);
    print("+++*** $map");
    UserLoginDetals.saveLogin(map["status"]);
    print("***${UserLoginDetals.getIsLogin()}");
    if (map["status"]) {
      SaveUserDet(map);
    }
  }

  Future<bool> IsLogin() async {
    Map<String, dynamic> map = await API(URL:URL).Login([phone, pass]);
    print("+++*** $map");
    UserLoginDetals.saveLogin(map["status"]);
    if (map["status"]) {
      SaveUserDet(map);
    } else {
      ShPUser().erase();
    }
    return map["status"];
  }
}

class Get_Lists {
  static String img = "img";
  static String categori = "category";
  static String mark = "mark";
  static String events = "events";
  static String model = "model";
  static String eventDetal = "eventDetal";

/*  final int index;
  Get_Lists(this.index);*/

  List getList(String apiName) {
    return ApiBase[apiName];
  }
}
