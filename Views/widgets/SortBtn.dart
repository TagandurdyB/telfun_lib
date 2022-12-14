import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/DDBBase.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'Dialog.dart';
import 'DropDownBtn/DropDownBtn.dart';
import 'imgBtn.dart';

/*class SortBtn extends StatelessWidget {
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
                       */
/* Table(
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: [
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text("Marka:")),
                                DropDownBtn(index:  0,itims: [DropDBid(value: "Samsung",id: 0),DropDBid(value: "123",id: 0)]),
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
                        )*/
/*
                      ],
                    ),
                  ),
                ),
            */
/*    actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],*/
/*
              )

              );
              //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SortPage()));
            },
            icon: Icon(
              Icons.align_horizontal_right_outlined,
              color: Colors.black,
            )));
  }


*/
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
/*

}*/
class SortBtn extends StatefulWidget {
  const SortBtn({
    Key key,
  }) : super(key: key);

  @override
  _SortBtnState createState() => _SortBtnState();
}

class _SortBtnState extends State<SortBtn> {

  @override
  Widget build(BuildContext context) {
    return ImgBtn(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.wifi_protected_setup,
          color: Color(0xff8017FF),
          size: SWi * 0.07,
        ),
      ),
      width: null,
      height: null,
      color: Colors.transparent,
      onTap: () {
       /* PopUppWidget(
          centerTitle: true,
          title: "Yzygiderlik",
          content: Column(
            children: [
              isReverse(),
              Divider(color: Colors.purple[800]),
              Row(
                children: [
                  Divider(height: 2, color: Colors.black),
                  //  SizedBox(),
                ],
              ),
              Row(children: [
                Icon(Icons.add),
                Text("salam"),
              ]),
              Row(children: [
                Icon(Icons.add),
                Text("salam"),
              ]),
              DropDownBtn(
                tag: DDBName.dDBLocation,
                onChanged: (index,val){
                  setState(() {
                  });
                },
                items: [
                  DDBEl(id: 12,value: "123",index: 1),
                  DDBEl(id: 11,value: "1234",index: 2),
                ],
              )
            ],
          ),
        ).popUp(context);*/
      },
    );
  }

  Column isReverse() {
    //final provider=Provider.of<UsesVar>(context);
    bool _isDEC=false;
    return Column(
              children: [
                Row(children: [
                  ImgBtn(
                    child: Icon(Icons.arrow_circle_up,
                        size: 40, color:!_isDEC?Colors.grey[400]:Colors.purple),
                    onTap: () {
                      setState(() {
                        _isDEC=true;
                      });
                    },
                    width: SWi * 0.2,
                    height: SWi * 0.15,
                    color: Colors.transparent,
                  ),
                  Text("Köpden Aza", style: TextStyle(fontSize: SWi * 0.045)),
                ]),
                Row(children: [
                  ImgBtn(
                    child: Icon(Icons.arrow_circle_down,
                        size: 40, color:_isDEC? Colors.grey[400]:Colors.purple),
                    onTap: () {
                      print("salam");
                      setState(() {
                        _isDEC=false;
                      });
                    },
                    width: SWi * 0.2,
                    height: SWi * 0.15,
                    color: Colors.transparent,
                  ),
                  Text("Azdan Köpe", style: TextStyle(fontSize: SWi * 0.045)),
                ]),
              ],
            );
  }
}
