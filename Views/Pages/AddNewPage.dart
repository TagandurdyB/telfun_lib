import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DropDownBtn.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import '../widgets/DropDownBtn/DDBBase.dart';
import '/ViewModels/MapConverter.dart';
import '/ViewModels/ApiElements.dart';
import '/ViewModels/Names.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/widgets/ScaffoldParts/MySnackBar.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '../widgets/ReadyInput/ReadyInput.dart';
import '/Views/widgets/imgBtn.dart';
import '/Models/service.dart';

class AddNewPage extends StatefulWidget {
  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  DDBEl DDColor, DDCategory, DDMark, DDModel, DDPlace;

  final TextStyle disable=ThemeProvided().styleDisable,enable=ThemeProvided().styleEnable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    empet();
  }

  void empet() {
    DDColor = DDBEl(index: -1);
    DDCategory = DDBEl(index: -1, value: "Bölümler");
    DDMark = DDBEl(index: -1, value: "Marka", id: 0);
    DDModel = DDBEl(index: -1, value: "Model", id: 0);
    DDPlace = DDBEl(index: -1, value: "Ýerleşýän ýeri");
  }

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
    return Container(
        padding: EdgeInsets.symmetric(horizontal: SWi * 0.08),
        //color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropDownBtnUnVal(
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
                                  DDPlace.index=0;
                                  setState(() {});
                                  print(
                                      "value:${DDPlace.value}  id:${DDPlace.id} index:${DDPlace.index}");
                                  print("place_ID:${DDBBase.getDate(DDBTags.dDBLocation).id.toString()}");
                                },
                                child: Text(
                                  "${_etraps[index].name}",textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: SWi*0.033),
                                ),
                              )),
                        ),
                        title: "${_element.value} Etraplar:",
                        centerTitle: true,
                        bgColor: Colors.white)
                        .popUp(context);
                  } else {
                    DDPlace = DDBEl(index: -1, value: "Ýerleşýän ýeri");
                  }
                },
              ),
              DropDownBtnUnVal(
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    selectIcon(Icons.view_list),
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
                    Get_Lists(listTag: ApiTags.categori).getList().length ?? 0,
                    (index) {
                  ElemCategory getlist =
                      Get_Lists(listTag: ApiTags.categori).getList()[index];
                  // print("LIst:${getlist.tm}");
                  return DDBEl(value: getlist.tm, id: getlist.id, index: index);
                }),
                onChanged: (DDBEl _element) {
                  setState(() {
                    DDCategory = _element;
                    DDMark = DDBEl(index: -1, value: "Marka");
                    DDModel = DDBEl(index: -1, value: "Model");
                    DDColor = DDBEl(index: -1);
                    canOpenAddBtn(context);
                  });
                },
              ),
              DropDownBtnUnVal(
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
                              style:
                                  DDMark.value == "Marka" ? disable : enable)),
                    ),
                  ],
                ),
                tag: DDBTags.dDBMark,
                items: DDBBase.getDate(DDBTags.dDBCategory).index == -1
                    ? [DDBEl(id: 0, index: -1, value: "")]
                    : List.generate(
                        Get_Lists(listTag: ApiTags.mark).getList().length ?? 0,
                        (index) {
                        ElemMark getlist =
                            Get_Lists(listTag: ApiTags.mark).getList()[index];
                        return DDBEl(
                            value: getlist.name, id: getlist.id, index: index);
                      }),
                onChanged: (DDBEl _element) {
                  setState(() {
                    DDMark = _element;
                    DDModel = DDBEl(index: -1, value: "Model");
                    DDColor = DDBEl(index: -1);
                    canOpenAddBtn(context);
                  });
                },
              ),
              DropDownBtnUnVal(
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    selectIcon(Icons.label),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(DDModel.value,
                              style:
                                  DDModel.value == "Model" ? disable : enable)),
                    ),
                  ],
                ),
                tag: DDBTags.dDBModel,
                items: DDCategory.index == -1
                    ? [DDBEl(id: 0, index: -1, value: "")]
                    : DDMark.index == -1
                        ? [DDBEl(id: 0, index: -1, value: "")]
                        : List.generate(_modelList.length ?? 0, (index) {
                            ElemModel getlist = _modelList[index];
                            return DDBEl(
                                index: index,
                                value: getlist.name,
                                id: getlist.id);
                          }),
                onChanged: (DDBEl _element) {
                  setState(() {
                    DDModel = _element;
                    DDColor = DDBEl(index: -1);
                    canOpenAddBtn(context);
                  });
                },
              ),
              DropDownBtnUnVal(
                tag: DDBTags.dDBColor,
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    selectIcon(Icons.palette_outlined),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text("Reňki:",
                            style: DDColor.index == -1 ? disable : enable),
                      ),
                    ),
                    DDColor.index == -1 ? Container() : DDColor.child,
                  ],
                ),
                items: DDModel.index == -1
                    ? [DDBEl(id: 0, index: -1, value: "")]
                    : List.generate(
                        Get_Lists(listTag: ApiTags.model)
                                .getList()
                                .where((element) => element.id == DDModel.id)
                                .toList()[0]
                                .colors
                                .length ??
                            0, (index) {
                        var getlist =   Get_Lists(listTag: ApiTags.model)
                            .getList()
                            .where((element) => element.id == DDModel.id)
                            .toList()[0]
                            .colors[index];
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
                                Text(getlist.tm),
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
              Container(
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
              AddNewBtn()
            ],
          ),
        ));
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
    if (DDColor.index == -1) d++;
    if (DDMark.index == -1) d++;
    if (DDModel.index == -1) d++;
    if (RIBase.getText(RITags.rIPrice)/*controls[1].text*/ == "") d++;
    if (d == 0) {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(true);
    } else {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
    }
  }

  Widget AddNewBtn() {
    Service service = Service(Url: '$IP/api/add');
    bool _about = false, _isUpload = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: _isUpload,
          child: Column(
            children: [
              CircularProgressIndicator(color: Colors.grey[400]),
              Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Bildirişiňiz goşulýança garaşyň.",
                    style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
        Visibility(
          visible: _about,
          child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                "Bildirişiňizi goşanyňyzdan soň, tä tassyklanýança halka açylmaýar. "
                "Şol sebäpden garaşmagyňyzy haýyş edýäris. ",
                style: TextStyle(fontSize: 18, color: Colors.blue),
                textAlign: TextAlign.center,
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SWi * 0.2),
          child: Builder(
            builder: (context) => ClipRRect(
              borderRadius: BorderRadius.circular(SWi * 0.05),
              child: MaterialButton(
                onPressed: () async {
                  print("place_ID:${DDBBase.getDate(DDBTags.dDBLocation).id.toString()}");
                  if (Provider.of<UsesVar>(context, listen: false).canAdd) {
                    _isUpload = true;
                    _about = true;
                    Map body = {
                      /*   "category_id": DDBBase().getDate(DDBName.dDBCategory).id.toString(),
                      "user_id": UserProperties.getProperty("id"),
                      'name': controls[0].text,
                      "mark_id":DDBBase().getDate(DDBName.dDBMark).id.toString(),
                      "price": controls[1].text,
                      "place": DDBBase().getDate(DDBName.dDBLocation).id.toString(),
                      "about": controls[2].text,*/
                      "user_id": UserProperties.getProperty("id"),
                      "place": DDPlace.id.toString(),
                         // DDBBase().getDate(DDBName.dDBLocation).id.toString(),
                      "price": RIBase.getText(RITags.rIPrice),//controls[1].text,
                      "color_id":
                          DDBBase.getDate(DDBTags.dDBColor).id.toString(),
                      "products_id":
                          DDBBase.getDate(DDBTags.dDBModel).id.toString(),
                    };
                    bool isUpload =
                        await service.addNewEvent(body, "$IP/api/new_add");
                    if (isUpload) {
                /*      controls.forEach((element) {
                        element.text = "";
                      });*/
                      _isUpload = false;
                      _about = false;
                      MySnack(
                              textColor: Colors.white,
                              message: "Bildiriş goşuldy!",
                              textBgColor: Color(0xff6A11AF))
                          .pushSnack(context);
                      Provider.of<UsesVar>(context, listen: false)
                          .navBarSelect(0);
                    } else {
                      setState(() {
                        _isUpload = false;
                      });
                      MySnack(
                              textColor: Colors.white,
                              textBgColor: Colors.red,
                              message: "Maglumatlary doly giriziň!")
                          .pushSnack(context);
                    }
                    setState(() {});
                  } else {}
                },
                height: 50,
                color: Provider.of<UsesVar>(context, listen: false).canAdd
                    ? Color(0xff5408BF)
                    : Colors.grey,
                child: Text(
                  "Bildiriş goş",
                  style: TextStyle(color: Colors.white, fontSize: SWi * 0.05),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
