import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/Views/Pages/MainPage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class SetingsPage extends StatelessWidget {
  // const SetingsPage({Key? key}) : super(key: key);

  _callNum(String num) async {
    launch("tel://$num");
  }
  TextEditingController txt=TextEditingController();
  String Num = "+99365000000";
  @override
  Widget build(BuildContext context) {
    void _Popop(String title,Widget body,bool IsOk) {
      showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text(
                  "$title",
                  style: TextStyle(fontSize: SWi * 0.05),
                ),
                content: body,
            actions: IsOk?[
              MaterialButton(onPressed: (){Navigator.pop(context);},
              child: Text("OK"),)
            ]:[],
              ));
    }
    /*    actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              )
    }*/
//txt.text="";
    return ScaffoldAll(
        body: Container(
      child: ListView(
        children: [
          SizedBox(height: 25),
          Card(
            child: ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Dil",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("${Provider.of<UsesVar>(context).SelectLang()}")
                ],
              ),
              onTap: (){
                _Popop("Diller",Card(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Provider.of<UsesVar>(context,listen: false).ChangeLang("TU");
                            },
                            child: Text("Türkmen ")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Provider.of<UsesVar>(context,listen: false).ChangeLang("RU");
                            },
                            child: Text("Rus ")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Provider.of<UsesVar>(context,listen: false).ChangeLang("EN");
                            },
                            child: Text("Iňlis ")),
                      ],
                    ),
                  ),
                ),false);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.green,
              ),
              title: Text("Habarlaşmak"),
              //  trailing: Text("$Num"),
              onTap: () {
                _Popop("Tel belgi",Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txt,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(60))),
                          //hintText: "Search same thing",
                          prefix: Text("+993",style: TextStyle(color: Colors.black),),
                          suffix: GestureDetector(
                              onTap: () =>
                              {txt.clear()} /*Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const MyApp()))*/
                              ,
                              child: Icon(Icons.cancel_rounded))),
                    ),
                  ),
                ),true);
               // _callNum(Num);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
