import 'package:flutter/material.dart';
import 'package:telfun/Models/Base.dart';

import 'JsonCacher.dart';
import 'MapConverter.dart';

class Json_Get extends StatelessWidget {
  final Widget Return;
  final String jsonName;
  Json_Get({
    Key key,
    @required this.Return,
    @required this.jsonName,
    // @required this.LIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: JsonListCacher(jsonName: jsonName).getDate(),
        builder: (ctx, ss) {
          if (ss.hasError) {
            print("Error Fail***");
          }
          if (ss.hasData) {
            Base(isAPI: false).add({
              jsonName:
                  MapConverter(JsonName: jsonName, MapList: ss.data).toElem()
            });
            return Return;
          } else {
            return loadingAnotherPageCircle();
          }
        });
  }

  Widget loadingAnotherPageCircle(){
    return Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
               /* gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                     // Colors.yellow,
                     // Color(0xff6911B0),
                     // Colors.red
                    ]),*/
            ),
            child: Container(child: CircularProgressIndicator())));
  }
}
