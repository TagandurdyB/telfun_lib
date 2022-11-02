import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/Views/Pages/CategoriPage.dart';

import '/Models/Public.dart';

class Categori extends StatelessWidget {
  final List list;
  final int index;
  String str = "Telfonlar";
  Categori({Key key, this.list, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<UsesVar>(context, listen: false).Select(0);
        categoriId = Get_Lists().getList(Get_Lists.categori)[index]["id"];
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Get_api(
                URL: "$IP/api/events",
                ApiName: Get_Lists.events,
                Return: CategoriPage())));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(SWi * 0.05),
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10)
            ],
            color: Color(0xff7262DF),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // colors: [Color(0xff8777FA), Color(0xffB493F0)])),
                colors: [
                  Color(0xff5102BA),
                  Color(0xff6C13AF),
                  Color(0xff7619AC)
                ])),
        margin: EdgeInsets.fromLTRB(8, 7, 8, 7),
        height: SWi * 0.35,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SWi * 0.05),
          child: Row(
            children: [
              SizedBox(width: SWi * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex:4,
                        child: Container(
                          alignment: Alignment.center,
                         // color: Colors.red,
                      child: Text("${list[index]["name"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaSoftBold",
                              fontSize: 30)),
                    )),
                    Expanded(

                      child: Container(
                       // color: Colors.blue,
                        //alignment: Alignment.bottomCenter,
                        child: Text(
                          "Bildirişler : (${list[index]["id"]})",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaSoftBold",
                              fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: SWi * 0.05),
              Container(
                width: SWi * 0.35,
                height: SWi * 0.35,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "$IP/storage/${list[index]["image"]}"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
