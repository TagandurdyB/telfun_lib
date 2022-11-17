import 'package:flutter/material.dart';
import 'package:telfun/Models/DDBBase.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/DropDownBtn/DropDownBtn.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String valuee=DDBBase().getDate(DDBName.dDBLocation).value;
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
        child: Column(
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
        ),
      ),
    );
  }
}
