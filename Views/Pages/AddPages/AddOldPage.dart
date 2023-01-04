import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
import 'package:telfun/Views/widgets/MyDropdown.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/AddBtn.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/MySnackBar.dart';
import '/ViewModels/ShPBDebug.dart';
import '../../widgets/DropDownBtn/DropDownBtn.dart';
import '/Models/Public.dart';
import '/Models/service.dart';
import '/Views/widgets/AddImg.dart';
import '../../widgets/ReadyInput/ReadyInput.dart';
import '/ViewModels/ApiDebuging.dart';

class AddOldPage extends StatefulWidget {
  @override
  _AddOldPageState createState() => _AddOldPageState();
}

class _AddOldPageState extends State<AddOldPage> {
  // List<String> inputValues = ["", "", ""];
  DDBEl DDCategory, DDMark, DDPlace, DDColor, DDModel;
  bool _isModel = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DDCategory = DDBEl(index: -1, value: "Bölümler");
    DDMark = DDBEl(index: -1, value: "Marka", id: 0);
    DDPlace = DDBEl(index: -1, value: "Ýerleşýän ýeri");
    DDModel = DDBEl(index: -1, value: "Model", id: 0);
    DDColor = DDBEl(index: -1);
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

  List _modelList = [];
  void modelFunc() {
    _modelList = Get_Lists(listTag: ApiTags.model)
        .getList()
        .where((element) =>
            element.category_id == DDCategory.id &&
            element.mark_id == DDMark.id)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    modelFunc();
    final TextStyle disable = Provider.of<ThemeProvided>(context).styleDisable,
        enable = Provider.of<ThemeProvided>(context).styleEnable;
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
                        List _etraps = Get_Lists(listTag: ApiTags.place)
                            .getList()[_element.id - 1]
                            .etraps;
                        if (_etraps.isNotEmpty) {
                          PopUppWidget(
                                  content: Column(
                                    children: List.generate(
                                        _etraps.length,
                                        (index) => TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                DDPlace.value =
                                                    "${_element.value} ${_etraps[index].name}";
                                                DDPlace.id = _etraps[index].id;
                                                DDPlace.index = 0;
                                                setState(() {});
                                                print(
                                                    "value:${DDPlace.value}  id:${DDPlace.id} index:${DDPlace.index}");
                                              },
                                              child: Text(
                                                "${_etraps[index].name}",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: SWi * 0.033),
                                              ),
                                            )),
                                  ),
                                  title: "${_element.value} Etraplar:",
                                  centerTitle: true,
                                  bgColor: ThemeProvided().colorCanvas)
                              .popUp(context);
                        } else {
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
                          selectIcon(Icons.view_list),
                          //selectIcon(Icons.account_tree_rounded),
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
                      tag: DDBTags.dDBCategory,
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
                          DDModel = DDBEl(index: -1, value: "Model", id: 0);
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
                          selectIcon(Icons.phone_android_rounded),
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
                      tag: DDBTags.dDBMark,
                      items: DDBBase.getDate(DDBTags.dDBCategory).index == -1
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
                          DDModel = DDBEl(index: -1, value: "Model", id: 0);

                          canOpenAddBtn(context);
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropDownBtnUnVal(
                      tag: DDBTags.dDBColor,
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          selectIcon(Icons.palette_outlined),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Reňki:",
                                  style:
                                      DDColor.index == -1 ? disable : enable),
                            ),
                          ),
                          DDColor.index == -1 ? Container() : DDColor.child,
                        ],
                      ),
                      items: List.generate(
                          Get_Lists(listTag: ApiTags.colors).getList().length ??
                              0, (index) {
                        var getlist =
                            Get_Lists(listTag: ApiTags.colors).getList()[index];
                        return DDBEl(
                            child: Row(
                              children: [
                                ImgBtn(
                                  width: 30,
                                  height: 30,
                                  color: getlist.toColor(),
                                  shape: 2,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey[400], blurRadius: 1)
                                  ],
                                ),
                                SizedBox(width: 10),
                                Text(
                                  getlist.tm,
                                  style: ThemeProvided().styleDisable,
                                ),
                              ],
                            ),
                            index: index,
                            value: getlist.tm,
                            id: getlist.id);
                      }),
                      onChanged: (DDBEl _element) {
                        setState(() {
                          print(_element.value);
                          DDColor = _element;
                          canOpenAddBtn(context);
                        });
                      },
                    ),
                  ),

                  Container(
                    child: Card(
                      color: ThemeProvided().colorCanvas,
                      child: SwitchListTile(
                        title: Text(
                          "Model ýok",
                          style: !_isModel?disable:enable,
                        ),
                        onChanged: (bool _val) {
                          setState(() {});
                          _isModel = !_isModel;
                          DDModel = DDBEl(index: -1, value: "Model", id: 0);
                        },
                        //activeColor: Colors.red,
                        //activeTrackColor: Colors.red,
                        selectedTileColor: Colors.red,
                        value: _isModel,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: !_isModel,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropDownBtnUnVal(
                          hint: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              selectIcon(Icons.label),
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(DDModel.value,
                                        style: DDModel.value == "Model"
                                            ? disable
                                            : enable)),
                              ),
                            ],
                          ),
                          tag: DDBTags.dDBModel,
                          items: DDCategory.index == -1
                              ? [DDBEl(id: 0, index: -1, value: "")]
                              : DDMark.index == -1
                                  ? [DDBEl(id: 0, index: -1, value: "")]
                                  : List.generate(_modelList.length ?? 0,
                                      (index) {
                                      ElemModel getlist = _modelList[index];
                                      return DDBEl(
                                          index: index,
                                          value: getlist.name,
                                          id: getlist.id);
                                    }),
                          onChanged: (DDBEl _element) {
                            setState(() {});
                              DDModel = _element;
                              canOpenAddBtn(context);
                          },
                        ),
                      )),
                  Visibility(
                    visible: _isModel,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadyInput(
                        shape: true,
                        // index: 0,
                        tag: RITags.rIName,
                        borderRad: SWi * 0.03,
                        hidden: "Modeli/Bildirişi ýazyň...",
                        label: "Modeliniň/Bildirişiň ady...",
                        onChange: (val, index) {
                          //inputValues[index] = controls[index].text;
                          canOpenAddBtn(context);
                        },
                      ),
                    ),
                  ),
                 /* Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ReadyInput(
                      shape: true,
                      // index: 1,
                      tag: RITags.rIPrice,
                      type: Type.num,
                      borderRad: SWi * 0.03,
                      hidden: "Bildirişiň bahasyny ýazyň...",
                      label: "Bahasy...",
                      onChange: (val, index) {
                        //inputValues[index] = controls[index].text;
                        canOpenAddBtn(context);
                      },
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: SWi * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ImgBtn(
                                width: SWi * 0.1,
                                height: SWi * 0.1,
                                shape: 10,
                                color: Color(0xff5408BF),
                                child: Icon(
                                  Icons.money_sharp,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "  Bahasy:",
                                  style: enable,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: SWi*0.02),
                                  width: SWi * 0.53,
                                  child: ReadyInput(
                                    shape: true,
                                    //index: 1,
                                    tag: RITags.rIPrice,
                                    type: Type.num,
                                    // borderRad: 60,
                                    hidden: "Bahasy manatda",
                                    label: "Bahasy manatda",
                                    onChange: (val, index) {
                                      setState(() {
                                        canOpenAddBtn(context);
                                      });
                                      // inputValues[index] = controls[index].text;
                                      // canOpenAddBtn(context);
                                    },
                                  ),
                                ),
                              ),
                              Text("TMT",style: ThemeProvided().styleUserPage),
                            ],
                          ),

                        ],
                      ),
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
                      // index: 2,
                      tag: RITags.rIAbout,
                      maxline: 3,
                      borderRad: SWi * 0.03,
                      hidden: "Bildirişiňiz barada maglumat ýazyň...",
                      label: "Bildiriş barada...",
                      onChange: (val, index) {
                        //inputValues[index] = controls[index].text;
                        canOpenAddBtn(context);
                      },
                    ),
                  ),
                  AddBtn(place_id: DDPlace.id,isModel: _isModel,),
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
    if (DDModel.index == -1&& RIBase.getText(RITags.rIName) == "") d++;
    // if (controls[1].text == "") d++;
   // if (RIBase.getText(RITags.rIName) == "") d++;
    if (RIBase.getText(RITags.rIPrice) == "") d++;
    if (RIBase.getText(RITags.rIAbout) == "") d++;
    if (d == 0) {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(true);
    } else {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
    }
  }
}
