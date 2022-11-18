
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/DDBBase.dart';
import 'package:telfun/Views/widgets/MyDropdown.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/AddBtn.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/MySnackBar.dart';
import '/ViewModels/ShPBDebug.dart';
import '../widgets/DropDownBtn/DropDownBtn.dart';
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
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyInput(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyInput(
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
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    //welayats
                    child: MyDropdown(
                      tag: DDBName.dDBLocation,
                      hidden: "Ýerleşýän ýeri",
                      icon: Icons.location_on_outlined,
                      items:[
                        DDBEl(id: 1, index: 0, value: "Asgabat"),
                        DDBEl(id: 2, index: 1, value: "Ahal"),
                        DDBEl(id: 3, index: 2, value: "Balkan"),
                        DDBEl(id: 4, index: 3, value: "Mary"),
                        DDBEl(id: 5, index: 4, value: "Lebap"),
                        DDBEl(id: 6, index: 5, value: "Daşoguz"),
                      ],
                    ),
                  ),
                  Container(
                    //welayats
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child:  MyDropdown(
                      tag: DDBName.dDBCategory,
                      hidden: "Bölümler",
                      icon: Icons.category,
                      items: List.generate(
                          Get_Lists().getList(Get_Lists.categori).length ?? 0,
                              (index) {
                            var getlist = Get_Lists().getList(Get_Lists.categori)[index];
                            return DDBEl(value: getlist["tm"], id: getlist["id"],index: index);
                          }),
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    child:  MyDropdown(
                      hidden: "Marka",
                      icon: Icons.bookmark,
                      tag: DDBName.dDBMark,
                      items: List.generate(
                          Get_Lists().getList(Get_Lists.mark).length ?? 0,
                              (index) {
                            var getlist =
                            Get_Lists().getList(Get_Lists.mark)[index];
                            return DDBEl(
                                value: getlist["name"], id: getlist["id"],index: index);
                          }),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0,vertical: SWi*0.04),
                    child: AddImages(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyInput(
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
                  ),

                  AddBtn(inputValues: inputValues),
                 /*    Column(children: [
                    Text("${UserProperties.getProperty("id")}"),
                    Text("${UserProperties.getProperty("name")}"),
                    Text("${UserProperties.getProperty("phone")}"),
                    Text("${UserProperties.getProperty("isban")}"),
                  ]),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


