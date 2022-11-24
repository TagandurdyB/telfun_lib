import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DropDownBtn.dart';
import '/Models/DDBBase.dart';
import '/ViewModels/MapConverter.dart';
import '/ViewModels/ApiElements.dart';
import '/ViewModels/Names.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/widgets/ScaffoldParts/MySnackBar.dart';
import '/Views/widgets/MyDropdown.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/ReadyInput.dart';
import '/Views/widgets/imgBtn.dart';
import '/Models/service.dart';

class AddNewPage extends StatefulWidget {
  @override
  _AddNewPageState createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  int modelIndex;
  DDBEl DDColor = DDBEl(index: -1),
      DDCategory = DDBEl(index:-1,value: "Bölümler"),
      DDMark = DDBEl(index:-1,value: "Marka", id: 0),
      DDModel = DDBEl(index:-1,value: "Model"),
      DDPlace = DDBEl(index:-1,value: "Ýerleşýän ýeri");
  final TextStyle enable =
          TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      disable = TextStyle(color: Colors.grey);
  //List models=Get_Lists().getList(Get_Lists.model).where((element) => element["mark_id"]==DDMark.id);

  @override
  Widget build(BuildContext context) {
    // print("*****************${DropDownBase[DDBName.dDBModel]}");
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
                    Get_Lists(listTag: ApiTags.categori).getList().length ?? 0,
                    (index) {
                  ElemCategory getlist =
                      Get_Lists(listTag: ApiTags.categori).getList()[index];
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
                    selectIcon(Icons.bookmark),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(DDMark.value,
                              style:
                                  DDMark.value == "Marka" ? disable : enable)),
                    ),
                  ],
                ),
                tag: DDBName.dDBMark,
                items: DDBBase().getDate(DDBName.dDBCategory).index == -1
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
                // hideText: widget.hidden,
                // onTap:widget.onTop,
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    selectIcon(Icons.view_in_ar_sharp),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(DDModel.value,
                              style:
                                  DDModel.value == "Model" ? disable : enable)),
                    ),
                  ],
                ),
                tag: DDBName.dDBModel,
                items: DDBBase().getDate(DDBName.dDBCategory).index == -1
                    ? [DDBEl(id: 0, index: -1, value: "")]
                    : DDBBase().getDate(DDBName.dDBMark).index == -1
                        ? [DDBEl(id: 0, index: -1, value: "")]
                        : List.generate(
                            Get_Lists(listTag: ApiTags.model)
                                    .getList()
                                    .where((element) =>
                                        element.category_id == DDCategory.id &&
                                        element.mark_id == DDMark.id)
                                    .toList()
                                    .length ??
                                0, (index) {
                            ElemModel getlist =
                                Get_Lists(listTag: ApiTags.model)
                                    .getList()
                                    .where((element) =>
                                        element.category_id == DDCategory.id &&
                                        element.mark_id == DDMark.id)
                                    .toList()[index];
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
                // hideText: widget.hidden,
                // onTap:widget.onTop,
                tag: DDBName.dDBColor,
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
                items: DDBBase().getDate(DDBName.dDBModel).index == -1
                    ? [DDBEl(id: 0, index: -1, value: "")]
                    : List.generate(
                        Get_Lists(listTag: ApiTags.model)
                                .getList()[
                                    DDBBase().getDate(DDBName.dDBModel).index]
                                .colors
                                .length ??
                            0, (index) {
                        var getlist = Get_Lists(listTag: ApiTags.model)
                            .getList()[
                                DDBBase().getDate(DDBName.dDBModel).index]
                            .colors[index];
                        int code =
                            int.parse("0xff${getlist.code.substring(1)}");
                        return DDBEl(
                            child: Row(
                              children: [
                                ImgBtn(
                                  width: 30,
                                  height: 30,
                                  color: Color(code),
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
                tag: DDBName.dDBLocation,
                items: [
                  DDBEl(id: 1, index: 0, value: "Asgabat"),
                  DDBEl(id: 2, index: 1, value: "Ahal"),
                  DDBEl(id: 3, index: 2, value: "Balkan"),
                  DDBEl(id: 4, index: 3, value: "Mary"),
                  DDBEl(id: 5, index: 4, value: "Lebap"),
                  DDBEl(id: 6, index: 5, value: "Daşoguz"),
                ],
                onChanged: (DDBEl _element) {
                  setState(() {
                    DDPlace = _element;
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
                        SizedBox(width: SWi * 0.02),
                        Container(
                          child: Text(
                            "Bahasy:",
                            style: TextStyle(
                              fontSize: SWi * 0.04,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            width: SWi * 0.80,
                            child: MyInput(
                              shape: true,
                              index: 1,
                              type: Type.num,
                              // borderRad: 60,
                              hidden: "Bahasy manatda",
                              label: "Bahasy manatda",
                              onControl: (val, index) {
                                setState(() {
                                  canOpenAddBtn(context);
                                });
                                // inputValues[index] = controls[index].text;
                                // canOpenAddBtn(context);
                              },
                            ),
                          ),
                        ],
                      ),
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
    if(DDPlace.index==-1) d++;
    if(DDCategory.index==-1) d++;
    if(DDColor.index==-1) d++;
    if(DDMark.index==-1) d++;
    if(DDModel.index==-1) d++;
    if (controls[1].text == "") d++;
    if (d == 0) {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(true);
    } else {
      Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
    }
  }

  Widget AddNewBtn() {
    Service service = Service();
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
                  if (Provider.of<UsesVar>(context, listen: false).canAdd()) {
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
                      "place":
                          DDBBase().getDate(DDBName.dDBLocation).value,
                      "price": controls[1].text,
                      "color_id":
                          DDBBase().getDate(DDBName.dDBColor).id.toString(),
                      "products_id":
                          DDBBase().getDate(DDBName.dDBModel).id.toString(),
                    };
                    bool isUpload =
                        await service.addNewEvent(body, "$IP/api/new_add");
                    if (isUpload) {
                      controls.forEach((element) {
                        element.text = "";
                      });
                        _isUpload = false;
                        _about = false;
                      MySnack(
                              textColor: Colors.white,
                              message: "Bildiriş ugradyldy",
                              textBgColor: Color(0xff5308BE))
                          .pushSnack(context);
                      Future.delayed(Duration(seconds: 3)).then((value) =>
                          MySnack(
                                  sec: 4,
                                  textColor: Colors.white,
                                  message: "Tassyklanmagyna garaşyň!",
                                  textBgColor: Colors.orange[700])
                              .pushSnack(context));
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
                color: Provider.of<UsesVar>(context, listen: false).canAdd()
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
