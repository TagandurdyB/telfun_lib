import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
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
        PopUppWidget(
          centerTitle: true,
          title: "Tertipleşdirme",
          content: Column(
            children: [
              sortGroup(),

            ],
          ),
        ).popUp(context);
      },
    );
  }

  Column sortGroup() {
    //final provider=Provider.of<UsesVar>(context);
   // bool _isDEC=false;
    final provider=Provider.of<UsesVar>(context,listen: false);
    return Column(
              children: [
                ImgBtn(
                  child: Row(
                    children: [
                      Icon(provider.sortNum!=0?Icons.adjust_outlined:Icons.album_outlined,
                          size: 40, color:provider.sortNum!=0? Colors.grey[400]:Colors.purple),
                      Text("  Asyl tertip", style: TextStyle(fontSize: SWi * 0.04)),
                    ],
                  ),
                  onTap: () {
                    print("0");
                   provider.changeSort(0);
                   Navigator.pop(context);
                  },
                  width: null,
                  height: SWi * 0.15,
                  color: Colors.transparent,
                ),
                ImgBtn(
                  child: Row(
                    children: [
                      Icon(provider.sortNum!=1?Icons.adjust_outlined:Icons.album_outlined,
                          size: 40, color:provider.sortNum!=1?Colors.grey[400]:Colors.purple),
                      Text("  Arzandan gymmada", style: TextStyle(fontSize: SWi * 0.04)),
                    ],
                  ),
                  onTap: () {
                    provider.changeSort(1);
                    Navigator.pop(context);
                  },
                  width: null,
                  height: SWi * 0.15,
                  color: Colors.transparent,
                ),
                ImgBtn(
                  child: Row(
                    children: [
                      Icon(provider.sortNum!=2?Icons.adjust_outlined:Icons.album_outlined,
                          size: 40, color:provider.sortNum!=2? Colors.grey[400]:Colors.purple),
                      Text("  Gymmatdan arzana", style: TextStyle(fontSize: SWi * 0.04)),
                    ],
                  ),
                  onTap: () {
                    print("salam");
                    provider.changeSort(2);
                    Navigator.pop(context);
                  },
                  width: null,
                  height: SWi * 0.15,
                  color: Colors.transparent,
                ),

              ],
            );
  }
}
