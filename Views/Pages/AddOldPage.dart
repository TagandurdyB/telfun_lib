
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Views/widgets/AddBtn.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/MySnackBar.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/widgets/DropDownBtn.dart';
import '/Models/Public.dart';
import '/Models/service.dart';
import '/Views/widgets/AddImg.dart';
import '/Views/widgets/ReadyInput.dart';
import '/ViewModels/ApiDebuging.dart';

class AddOldPage extends StatelessWidget {
  List<String> inputValues = ["", "", ""];
void canOpenAddBtn(BuildContext context){
  int d=0;
  if(controls[0].text=="") d++;
  if(controls[1].text=="") d++;
  if(controls[2].text=="") d++;
if (d==0&&imageOk){
   Provider.of<UsesVar>(context,listen: false).changeCanAdd(true);}
 else{
   Provider.of<UsesVar>(context,listen: false).changeCanAdd(false);
 }
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyInput(
                  shape: true,
                  index: 0,
                  borderRad: 60,
                  hidden: "Bildirişiň adyny ýazyň...",
                  label: "Bildirişiň ady...",
                  onControl: (val, index) {
                    inputValues[index] = controls[index].text;
                    canOpenAddBtn(context);
                  },
                ),
                MyInput(
                  shape: true,
                  index: 1,
                  type: Type.num,
                  borderRad: 60,
                  hidden: "Bildirişiň bahasyny ýazyň...",
                  label: "Bahasy...",
                  onControl: (val, index) {
                    inputValues[index] = controls[index].text;
                    canOpenAddBtn(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      //welayats
                      child: DropdawnChange(
                        index: 4,
                        itims: [
                          DropDBid(value: "Aşgabat", id: 0),
                          DropDBid(value: "Ahal", id: 1),
                          DropDBid(value: "Balkan", id: 2),
                          DropDBid(value: "Mary", id: 3),
                          DropDBid(value: "Lebap", id: 4),
                          DropDBid(value: "Daşoguz", id: 5),
                        ],
                      ),
                    ),
                    Container(
                      //marks
                      child: DropdawnChangeOnly(
                        index: 5,
                        itims: List.generate(
                            Get_Lists().getList(Get_Lists.mark).length ?? 0,
                            (index) {
                          var getlist =
                              Get_Lists().getList(Get_Lists.mark)[index];
                          return DropDBid(
                              value: getlist["name"], id: getlist["id"]);
                        }),
                      ),
                    ),
                  ],
                ),
                //categories
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Bölümler:"),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdawnChangeOnly(
                      index: 6,
                      itims: List.generate(
                          Get_Lists().getList(Get_Lists.categori).length ?? 0,
                          (index) {
                        var getlist =
                            Get_Lists().getList(Get_Lists.categori)[index];
                        return DropDBid(
                            value: getlist["tm"], id: getlist["id"]);
                      }),
                    ),
                  ),
                ]),
                //AddImages(),
                AddImages(),
                MyInput(
                  shape: true,
                  index: 2,
                  maxline: 3,
                  borderRad: 30,
                  hidden: "Bildirişiňiz barada maglumat ýazyň...",
                  label: "Bildiriş barada...",
                  onControl: (val, index) {
                    inputValues[index] = controls[index].text;
                    canOpenAddBtn(context);
                  },
                ),

                AddBtn(inputValues: inputValues),
                /*   Column(children: [
                  Text("${UserProperties.getProperty("id")}"),
                  Text("${UserProperties.getProperty("name")}"),
                  Text("${UserProperties.getProperty("phone")}"),
                  Text("${UserProperties.getProperty("isban")}"),
                ]),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}


