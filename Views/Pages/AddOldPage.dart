import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/Models/DDBBase.dart';
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
import '/Views/widgets/ReadyInput.dart';
import '/ViewModels/ApiDebuging.dart';

class AddOldPage extends StatefulWidget {
  @override
  _AddOldPageState createState() => _AddOldPageState();
}

class _AddOldPageState extends State<AddOldPage> {
  List<String> inputValues = ["", "", ""];
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
                      tag: DDBName.dDBLocation,
                      items: [
                        DDBEl(id: 1, index: 0, value: "Aşgabat"),
                        DDBEl(id: 2, index: 1, value: "Ahal"),
                        DDBEl(id: 3, index: 2, value: "Balkan"),
                        DDBEl(id: 4, index: 3, value: "Mary"),
                        DDBEl(id: 5, index: 4, value: "Lebap"),
                        DDBEl(id: 6, index: 5, value: "Daşoguz"),
                      ],
                      onChanged: (DDBEl _element) {
                        DDPlace = _element;
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
                                            DDPlace.value +=
                                            " ${_etraps[index].name}";
                                            DDPlace.id = _etraps[index].id;
                                            setState(() {});
                                            print(
                                                "value:${DDPlace
                                                    .value}  id:${DDPlace
                                                    .id} index:${DDPlace
                                                    .index}");
                                          },
                                          child: Text(
                                            "${_etraps[index].name}",
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
                  Container(
                    //welayats
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropDownBtnUnVal(
                      // hideText: widget.hidden,
                      // onTap:widget.onTop,
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          selectIcon(Icons.category),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(DDCategory.value,
                                    style: DDCategory.value == "Bölümler"
                                        ? disable
                                        : enable)),
                          ),
                        ],
                      ),
                      tag: DDBName.dDBCategory,
                      items: List.generate(
                          Get_Lists(listTag: ApiTags.categori)
                                  .getList()
                                  .length ??
                              0, (index) {
                        ElemCategory getlist =
                            Get_Lists(listTag: ApiTags.categori)
                                .getList()[index];
                        return DDBEl(
                            value: getlist.tm, id: getlist.id, index: index);
                      }),
                      onChanged: (DDBEl _element) {
                        setState(() {
                          DDCategory = _element;
                          canOpenAddBtn(context);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropDownBtnUnVal(
                      // hideText: widget.hidden,
                      // onTap:widget.onTop,
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          selectIcon(Icons.bookmark),
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(DDMark.value,
                                    style: DDMark.value == "Marka"
                                        ? disable
                                        : enable)),
                          ),
                        ],
                      ),
                      tag: DDBName.dDBMark,
                      items: DDBBase().getDate(DDBName.dDBCategory).index == -1
                          ? [DDBEl(id: 0, index: -1, value: "")]
                          : List.generate(
                              Get_Lists(listTag: ApiTags.mark)
                                      .getList()
                                      .length ??
                                  0, (index) {
                              ElemMark getlist =
                                  Get_Lists(listTag: ApiTags.mark)
                                      .getList()[index];
                              return DDBEl(
                                  value: getlist.name,
                                  id: getlist.id,
                                  index: index);
                            }),
                      onChanged: (DDBEl _element) {
                        setState(() {
                          DDMark = _element;
                          canOpenAddBtn(context);
                        });
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
    if (DDCategory.index == -1) d++;
    if (DDMark.index == -1) d++;
    if (controls[1].text == "") d++;
    if (d == 0) {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(true);
    } else {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
    }
  }
}
