import 'package:flutter/material.dart';
import 'package:telfun/Views/widgets/AddShopBtn.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
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
import '../widgets/ReadyInput/ReadyInput.dart';
import '/ViewModels/ApiDebuging.dart';

class AddShopPage extends StatefulWidget {
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  DDBEl DDCategory, DDMark, DDPlace;
  final TextStyle enable =
  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      disable = TextStyle(color: Colors.grey);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DDCategory = DDBEl(index: -1, value: "Bölümler");
    DDMark = DDBEl(index: -1, value: "Marka", id: 0);
    DDPlace = DDBEl(index: -1, value: "Ýerleşýän ýeri");
  }

/*void canOpenAddBtn(BuildContext context){
  int d=0;
  if(controls[0].text=="") d++;
  if(controls[1].text=="") d++;
  if(controls[2].text=="") d++;
if (d==0&&imageOk){
   Provider.of<UsesVar>(context,listen: false).changeCanAdd(true);}
 else{
   Provider.of<UsesVar>(context,listen: false).changeCanAdd(false);
 }
}*/

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      body: Container(
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
                      child: ReadyInput(
                        shape: true,
                        suffixFunc: (){
                          Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
                        },
                        //index: 0,
                        tag: RITags.rIName,
                        borderRad: SWi*0.03,
                        hidden: "Dükanyň adyny ýazyň...",
                        label: "Dükanyň ady...",
                        onChange: (val, index) {
                          //inputValues[index] = controls[index].text;
                          canOpenAddBtn(context);
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      //welayats
                      child: DropDownBtnUnVal(
                        // hideText: widget.hidden,
                        // onTap:widget.onTop,
                        hint: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            selectIcon(Icons.location_on_outlined),
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(DDPlace.value,
                                      style: DDPlace.value == "Ýerleşýän ýeri"
                                          ? disable
                                          : enable)),
                            ),
                          ],
                        ),
                        tag: DDBTags.dDBLocation,
                        items: [
                          DDBEl(id: 1, index: 0, value: "Aşgabat"),
                          DDBEl(id: 2, index: 1, value: "Ahal"),
                          DDBEl(id: 3, index: 2, value: "Balkan"),
                          DDBEl(id: 4, index: 3, value: "Mary"),
                          DDBEl(id: 5, index: 4, value: "Lebap"),
                          DDBEl(id: 6, index: 5, value: "Daşoguz"),
                        ],
                        onChanged: (DDBEl _element) {
                          canOpenAddBtn(context);
                          List _etraps= Get_Lists(listTag: ApiTags.place)
                              .getList()[_element.id - 1]
                              .etraps;
                          if(_etraps.isNotEmpty) {
                            PopUppWidget(
                                content: Column(
                                  children: List.generate(
                                      _etraps.length,
                                          (index) =>
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              DDPlace.value =
                                              "${_element.value} ${_etraps[index].name}";
                                              DDPlace.id = _etraps[index].id;
                                              DDPlace.index=0;
                                              setState(() {});
                                              print(
                                                  "value:${DDPlace
                                                      .value}  id:${DDPlace
                                                      .id} index:${DDPlace
                                                      .index}");
                                            },
                                            child: Text(
                                              "${_etraps[index].name}",textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          )),
                                ),
                                title: "${_element.value} Etraplar:",
                                centerTitle: true,
                                bgColor: Colors.white)
                                .popUp(context);
                          }
                          else{
                            DDPlace = DDBEl(index: -1, value: "Ýerleşýän ýeri");
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: SWi * 0.015),
                      child: AddImages(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadyInput(
                        shape: true,
                        suffixFunc: (){
                          Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
                        },
                        //index: 2,
                        tag: RITags.rIAbout,
                        maxline: 3,
                        borderRad: SWi*0.03,
                        hidden: "Dükanyňyz barada maglumat ýazyň...",
                        label: "Dükanyňyz barada...",
                        onChange: (val, index) {
                          //inputValues[index] = controls[index].text;
                          canOpenAddBtn(context);
                        },
                      ),
                    ),
                    AddShopBtn(),
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
      ),
    );
  }

  Widget selectIcon(IconData iconData) {
    return ImgBtn(
      width: SWi * 0.1,
      height: SWi * 0.1,
      shape: 10,
      color: Color(0xff5408BF),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }

  void canOpenAddBtn(BuildContext context) {
    int d = 0;
    if (DDPlace.index == -1) d++;
    if(RIBase.getText(RITags.rIName)=="")d++;
    if(RIBase.getText(RITags.rIAbout)=="")d++;
    //if(RIBase.getText(RITags.rIPrice)=="")d++;
    //if (controls[1].text == "") d++;
    //if (controls[2].text == "") d++;
    if (d == 0) {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(true);
    } else {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
    }
  }
}

/* Text("name"),
            Text("image"),
            Text("place"),
            Text("phone"),
            Text("user_id"),
            Text("about"),*/