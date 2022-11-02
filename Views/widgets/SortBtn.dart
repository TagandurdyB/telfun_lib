import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';

import 'DropDownBtn.dart';

class SortBtn extends StatelessWidget {
  // const SortBtn({Key? key}) : super(key: key);
List<String> filters=["Samsung","G9","3000TM","Gowy"];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: SWi * 0.03, right: SWi * 0.03),
        alignment: Alignment.centerRight,
        child: IconButton(
            onPressed: () {
              showDialog(context: context, builder:(context)=>
              CupertinoAlertDialog(
                title: Text("Filterler",style: TextStyle(fontSize: SWi*0.05),),
                content: Card(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Marka:")),
                                DropdawnChange(index:  0,itims: [DropDBid(value: "Samsung",id: 0),DropDBid(value: "123",id: 0)]),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Model:")),
                                DropdawnChange(index: 1,itims: [DropDBid(value: "G9",id: 0),DropDBid(value: "Samsung",id: 0)]),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Baha:")),
                                DropdawnChange(index: 2,itims: [DropDBid(value: "3000TM",id: 0),DropDBid(value: "Samsung",id: 0)]),
                              ],
                            ),
                            TableRow(
                              children: [
                                Center(child: Text("Ýagdaýy:")),
                                DropdawnChange(index: 3,itims: [DropDBid(value: "Gowy",id: 0),DropDBid(value: "Samsung",id: 0)]),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
            /*    actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],*/
              )

              );
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SortPage()));
            },
            icon: Icon(
              Icons.align_horizontal_right_outlined,
              color: Colors.black,
            )));
  }


/*  DropdownButton<String> DropdawnChange(int value,List itims) {
    return DropdownButton(
      items: <String>["Nagyt", "Kartdan"].map((val) {
        return DropdownMenuItem(child: Text(val), value: val);
      }).toList(),
      value:filters[value],
      onChanged: (String newVal) {
        setState(() {
          value=="Aşgabat"?region= newVal:payment= newVal;
        });
      },
    );
  }*/

}


