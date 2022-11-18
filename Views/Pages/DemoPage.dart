import 'package:flutter/material.dart';
import 'package:telfun/Models/DDBBase.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/DropDownBtn/DropDownBtn.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String Value;
  String valuee=DDBBase().getDate(DDBName.dDBLocation).value;
  bool boolDrop=true;
List menuItems=List();

  Map web={
    "1":"PHP0",
    "2":"PHP1",
    "3":"PHP2",
  };
  Map app={
    "1":"Flutter0",
    "2":"Flutter1",
    "3":"Flutter2",
  };
  Map pc={
    "1":"C",
    "2":"C#",
    "3":"C++",
  };

  void populateWeb(){
    for(String key in web.keys){
      menuItems.add(
        DropdownMenuItem(
          value: web[key],
          child: Text(web[key]),
        )
      );
    }
  }
  void populateApp(){
    for(String key in web.keys){
      menuItems.add(
          DropdownMenuItem(
            value: web[key],
            child: Text(web[key]),
          )
      );
    }
  }
  void populatePC(){
    for(String key in web.keys){
      menuItems.add(
          DropdownMenuItem(
            value: web[key],
            child: Text(web[key]),
          )
      );
    }
  }

  void valueChanged(String _value){
    if(_value=="1") {
      menuItems=[];
      populateWeb();
    }
    if(_value=="2") {
      menuItems=[];
      populateApp();
    }
    if(_value=="3") {
      menuItems=[];
      populatePC();
    }
    setState(() {
      Value=_value;
      boolDrop=false;
    });
  }

  void secondV(String _value){
setState(() {
  Value=_value;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Page"),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[800],
        child: /*Column(
          children: [
            DropDownBtn(
              onChanged:(String value){
                setState(() {
                  valuee=DDBBase().getDate(DDBName.dDBLocation).value;
                });
                print("${value}");
              } ,
              tag: DDBName.dDBLocation,
              hideText: "salams",
              items: [
                DDBEl(id: 1, index: 0, value: "Asgabat"),
                DDBEl(id: 2, index: 1, value: "Balkan"),
                DDBEl(id: 3, index: 2, value: "Lebap"),
                DDBEl(id: 4, index: 3, value: "Dasoguz"),
                DDBEl(id: 5, index: 4, value: "Mary"),
                DDBEl(id: 6, index: 5, value: "Ahal"),
              ],
            ),
            DropDownBtn(
              onChanged:(String value){
                setState(() {
                  valuee=DDBBase().getDate(DDBName.dDBColor).value;
                });
                print("${value}");
              } ,
              tag: DDBName.dDBColor,
              hideText: "salams",
              items: [
                DDBEl(id: 1, index: 0, value: "Asgabat"),
                DDBEl(id: 2, index: 1, value: "Balkan"),
                DDBEl(id: 3, index: 2, value: "Lebap"),
                DDBEl(id: 4, index: 3, value: "Dasoguz"),
                DDBEl(id: 5, index: 4, value: "Mary"),
                DDBEl(id: 6, index: 5, value: "Ahal"),
              ],
            ),
            DropDownBtn(
              onChanged:(String value){
                setState(() {
                  valuee=DDBBase().getDate(DDBName.dDBModel).value;
                });
                print("${value}");
              } ,
              tag: DDBName.dDBModel,
              hideText: "salams",
              items: [
                DDBEl(id: 1, index: 0, value: "Asgabat"),
                DDBEl(id: 2, index: 1, value: "Balkan"),
                DDBEl(id: 3, index: 2, value: "Lebap"),
                DDBEl(id: 4, index: 3, value: "Dasoguz"),
                DDBEl(id: 5, index: 4, value: "Mary"),
                DDBEl(id: 6, index: 5, value: "Ahal"),
              ],
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "${DDBBase().getDate(DDBName.dDBLocation).value}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ))
          ],
        )*/
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          DropdownButton<String>(
            value: Value,
              items: [
            DropdownMenuItem(child: Text("one"),value: "1"),
            DropdownMenuItem(child: Text("Two"),value: "2"),
            DropdownMenuItem(child: Text("Three"),value: "3"),
          ],
          onChanged: (_value)=>valueChanged(_value),
            hint: Text("Seleck filter"),
          ),
            DropdownButton<String>(
            //  value: Value,
              items: [
                DropdownMenuItem(child: Text("one"),value: "1"),
                DropdownMenuItem(child: Text("Two"),value: "2"),
                DropdownMenuItem(child: Text("Three"),value: "3"),
                DropdownMenuItem(child: Text("Four"),value: "4"),
              ],
              onChanged:boolDrop? null:(_value)=>secondV(_value),/*(_value){
                setState(() {
                  Value=_value;
                });
              },*/
              hint: Text("Seleck color"),
              disabledHint: Text("First select filter"),
            ),
            Text("${Value}"),
        ],),
      ),
    );
  }
}
