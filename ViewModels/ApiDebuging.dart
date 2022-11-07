import 'package:flutter/material.dart';
import '../Views/LogoPage.dart';
import '/Models/connect.dart';
import 'ShPBDebug.dart';

//APILists ApiList;
const String IP = "https://it.net.tm/telfun";

class Get_api extends StatelessWidget {
  final String URL;
  final Widget Return;
  final String ApiName;
  // final int LIndex;
  const Get_api({
    Key key,
    @required this.URL,
    @required this.Return,
    @required this.ApiName,
    // @required this.LIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: API(URL).getDate(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
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
                        //color: Colors.red,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.yellow, Colors.red])),
                    child: Container(child: CircularProgressIndicator())));
          }
        });
  }
}

class Get_Me{
  final String URL,token;

  Get_Me({this.URL,this.token});
  check()async{
   var ss=await API(URL).getBerarer(token);
   print(ss);
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
    Map<String, dynamic> map = await API(URL).Register([name, phone, pass]);
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
    Map<String, dynamic> map = await API(URL).Register([name, phone, pass]);
    print("+++*** $map");
    UserLoginDetals.saveLogin(map["status"]);
    print("***${UserLoginDetals.getIsLogin()}");
    if (map["status"]) {
      SaveUserDet(map);
    }
  }

  Future<bool> IsLogin() async {
    Map<String, dynamic> map = await API(URL).Login([phone, pass]);
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
/*  final int index;
  Get_Lists(this.index);*/

  List getList(String apiName) {
    return ApiBase[apiName];
  }
}
