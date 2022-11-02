import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        color: Colors.grey)
                  ],
                  color: Color(0xffF0EBFF),
                ),
                height: 100,
                width: SWi,
                padding: EdgeInsets.all(SWi * 0.03),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${UserProperties.getProperty("name")[0].toUpperCase()}")),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${UserProperties.getProperty("name")}",
                          style: TextStyle(fontSize: SWi * 0.05),
                        ),
                        Text(
                          "Şahsy",
                          style: TextStyle(fontSize: SWi * 0.03),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(width: SWi, height: 100, color: Colors.transparent),
              MyProfil(),
            ],
          ),
        );
  }
}

class MyProfil extends StatelessWidget {
  //const MyProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Halanlarym"),
            trailing: Text("0"),
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(leading: Text("Meniň bildirişlerim")),
              ListTile(leading: Text("Ähli"), trailing: Text("0")),
              ListTile(leading: Text("Satylan"), trailing: Text("0")),
              ListTile(leading: Text("Garaşylýan"), trailing: Text("0")),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              ListTile(leading: Text("Sargytlar")),
              ListTile(leading: Text("Ähli"), trailing: Text("0")),
              ListTile(leading: Text("Garaşylýan"), trailing: Text("0")),
              ListTile(leading: Text("Tölege garaşylýan"), trailing: Text("0")),
              ListTile(leading: Text("Ugradylmaga garaşylýan"), trailing: Text("0")),
              ListTile(leading: Text("Ugradylan"), trailing: Text("0")),
            ],
          ),
        ),
      ],
    );
  }
}
