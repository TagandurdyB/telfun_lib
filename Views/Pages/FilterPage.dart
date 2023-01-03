import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/FilterProvider.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/ViewModels/ValueProvider.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DropDownBtn.dart';
import 'package:telfun/Views/widgets/FilterSwitch.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Json_Get(
      jsonName: JsonTags.filterMark,
      Return: Json_Get(
        jsonName: JsonTags.filterModel,
        Return: Json_Get(
          jsonName: JsonTags.filterColor,
          Return: Json_Get(
            jsonName: JsonTags.filterPlace,
            Return: Json_Get(
              jsonName: JsonTags.filterEtrap,
              Return: FilterView(),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterView extends StatefulWidget {
  // const SetingsPage({Key? key}) : super(key: key);

  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  DDBEl DDColor, DDMark, DDModel, DDPlace, DDTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    erease();
    Provider.of<FilterProvider>(context, listen: false).reload();
  }

  void erease() {
    DDColor = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDMark = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDModel = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDPlace = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDTime = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
  }

  @override
  Widget build(BuildContext context) {
    final providerFilter = Provider.of<FilterProvider>(context);
    final providerValues = Provider.of<ValuesProvider>(context);
    final TextStyle disable = Provider.of<ThemeProvided>(context).styleDisable,
        enable = Provider.of<ThemeProvided>(context).styleEnable;
    return ScaffoldAll(
        body: Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: SWi * 0.06, vertical: SWi * 0.03),
              child: Text("Filtirler",
                  style: TextStyle(
                      fontSize: SWi * 0.06, fontWeight: FontWeight.w800))),
          Card(
            color: ThemeProvided().colorCanvas,
            child: ListTile(
              onTap: () {
                final List _marks = providerValues.markObjs;
                // PopDrop(context, _marks, "Markalar").popUp(context);
                PopStateFull(
                        context: context,
                        list: _marks,
                        title: "Markalar",
                        jsonTag: JsonTags.filterMark)
                    .pop;
              },
              title: Text(
                "Markalar",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "${DDMark.value}",
                textAlign: TextAlign.left,
                style: ThemeProvided().styleDisable,
              ),
            ),
          ),
          Card(
            color: ThemeProvided().colorCanvas,
            child: ListTile(
              onTap: () {
                final List _models = providerFilter.modelObjs;
                //PopDrop(context, _models, "Modeller").popUp(context);
                PopStateFull(
                        context: context,
                        list: _models,
                        title: "Modeller",
                        jsonTag: JsonTags.filterModel)
                    .pop;
              },
              title: Text(
                "Modeller",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "${DDModel.value}",
                textAlign: TextAlign.left,
                style: ThemeProvided().styleDisable,
              ),
            ),
          ),
          Card(
            color: ThemeProvided().colorCanvas,
            child: ListTile(
              onTap: () {
                final List _colors = providerValues.colorObjs;
                //PopDrop(context, _colors, "Reňki").popUp(context);
                PopStateFull(
                        context: context,
                        list: _colors,
                        title: "Reňki",
                        jsonTag: JsonTags.filterColor)
                    .pop;
              },
              title: Text(
                "Reňki",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "${DDColor.value}",
                textAlign: TextAlign.left,
                style: ThemeProvided().styleDisable,
              ),
            ),
          ),
          Card(
            color: ThemeProvided().colorCanvas,
            child: ListTile(
              onTap: () {
                print("salam");
                PopUppWidget(
                    title: "Bahasy",
                    content: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ReadyInput(
                              tag: RITags.rIMin,
                              label: "iň arzan",
                              shape: true,
                              borderRad: 2,
                              onChange: (_value, _tag) {},
                            ),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ReadyInput(
                              tag: RITags.rIMax,
                              shape: true,
                              borderRad: 2,
                              label: "iň gymmat",
                              onChange: (_value, _tag) {},
                            ),
                          )),
                        ],
                      ),
                    ),
                    actionsTeam: [ActionsTeam(text: "SAÝLA")]).popUp(context);
              },
              title: Text(
                "Bahasy",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "Saýlanmadyk",
                textAlign: TextAlign.left,
                style: ThemeProvided().styleDisable,
              ),
            ),
          ),
          Card(
            color: ThemeProvided().colorCanvas,
            child: ListTile(
              onTap: () {
                final List _place = providerValues.placeObjs;
                /*  final List _place=[
                  DDBEl(id: 1, index: 0, value: "Aşgabat"),
                  DDBEl(id: 2, index: 1, value: "Ahal"),
                  DDBEl(id: 3, index: 2, value: "Balkan"),
                  DDBEl(id: 4, index: 3, value: "Mary"),
                  DDBEl(id: 5, index: 4, value: "Lebap"),
                  DDBEl(id: 6, index: 5, value: "Daşoguz"),
                ];*/
                /*PopDrop(context, _place, "Ýerleşýän ýeri").popUp(context);
                // final List _place = Get_Lists(listTag: ApiTags.place).getList();
                PopDrop(context, _place, "Ýerleşýän ýeri").popUp(context);*/
                PopStateFull(
                        context: context,
                        list: _place,
                        title: "Ýerleşýän ýeri",
                        jsonTag: JsonTags.filterPlace)
                    .pop;
              },
              title: Text(
                "Ýerleşýän ýeri",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "${DDPlace.value}",
                textAlign: TextAlign.left,
                style: ThemeProvided().styleDisable,
              ),
            ),
          ),
          Card(
            color: ThemeProvided().colorCanvas,
            child: ListTile(
              leading: Text("Goýulan wagty"),
              trailing: Container(
                width: SWi * 0.4,
                child: DropDownBtnUnVal(
                  hint: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(DDTime.value, style: enable)),
                      ),
                    ],
                  ),
                  tag: DDBTags.dDBTime,
                  items: [
                    DDBEl(id: 1, index: 0, value: "Hemmesi"),
                    DDBEl(id: 2, index: 1, value: "Soňky 1 sag"),
                    DDBEl(id: 3, index: 2, value: "Soňky 5 sag"),
                    DDBEl(id: 4, index: 3, value: "Soňky 1 gün"),
                    DDBEl(id: 5, index: 4, value: "Soňky 3 gün"),
                    DDBEl(id: 6, index: 5, value: "Soňky 7 gün"),
                  ],
                  onChanged: (DDBEl _element) {
                    DDTime = _element;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  child: Text('9 SANY'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    /* textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),*/
                  ),
                ),
              )),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("ÝATDASAKLA")))),
            ],
          )
        ],
      ),
    ));
  }

  PopUppWidget PopDrop(
      BuildContext context, List<dynamic> _list, String _title) {
    String _name = "";
    bool _isCheck = false;
    return PopUppWidget(
        content: Column(
          children: List.generate(_list.length + 1, (index) {
            var _obj;
            if (index != 0) _obj = _list[index - 1];
            if (_title != "Reňki")
              _name = index != 0 ? _obj.name : "Ähli";
            else
              _name = index != 0 ? _obj.tm : "Ähli";
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImgBtn(
                  onTap: () {
                    if (_title == "Markalar") {
                      DDMark.value = index != 0 ? _obj.name : "Ähli";
                      DDMark.id = index != 0 ? _obj.id : 0;
                      DDMark.index = 0;
                    } else if (_title == "Modeller") {
                      DDModel.value = index != 0 ? _obj.name : "Ähli";
                      DDModel.id = index != 0 ? _obj.id : 0;
                      DDModel.index = 0;
                    } else if (_title == "Reňki") {
                      DDColor.value = index != 0 ? _obj.tm : "Ähli";
                      DDColor.id = index != 0 ? _obj.id : 0;
                      DDColor.index = 0;
                    } else if (_title == "Ýerleşýän ýeri") {
                      DDPlace.value = index != 0 ? _obj.name : "Ähli";
                      DDPlace.id = index != 0 ? _obj.id : 0;
                      DDPlace.index = 0;
                    }
                    setState(() {});
                    // Navigator.pop(context);
                  },
                  width: double.infinity,
                  height: SWi * 0.1,
                  color: Colors.transparent,
                  child: Container(
                    child: ListTile(
                      leading: Text(
                        "$_name",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: SWi * 0.033),
                      ),
                      trailing: Container(
                        child: Checkbox(
                          value: _isCheck,
                          onChanged: (bool _val) {
                            _isCheck = _val;
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.purpleAccent)
              ],
            );
          }),
        ),
        title: "$_title:",
        centerTitle: true,
        bgColor: ThemeProvided().colorCanvas);
  }

/*  PopStateFull(context, List _list, String title) {
    bool _isCheck = false;
    return showDialog(
        context: context,
        builder: (context) => Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child:
                      CheckList(isCheck: _isCheck, list: _list, title: title)),
            ));
  }*/
}

class PopStateFull {
  final BuildContext context;
  bool isCheck;
  final List list;
  final String title, jsonTag;
  PopStateFull(
      {this.jsonTag, this.context, this.list, this.isCheck, this.title});
  get pop => showDialog(
      context: context,
      builder: (context) => CheckList(title: title, list: list,jsonTag: jsonTag));
}

class CheckList extends StatefulWidget {
  bool isCheck;
  final List list;
  final String title, jsonTag;
  CheckList({this.list, this.isCheck, this.title, this.jsonTag});

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckList> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold(context, widget.title, widget.list);
  }

  Scaffold buildScaffold(BuildContext context, String title, List list) {
    final providerValues = Provider.of<ValuesProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        color: Colors.black26,
        alignment: Alignment.center,
        child: ImgBtn(
          color: ThemeProvided().colorModel,
          width: SWi * 0.8,
          height: SHe * 0.8,
          shape: SWi * 0.02,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  title + " :",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: SWi * 0.04),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(widget.list.length + 1, (index) {
                      if (index == 0) {
                        return FilterSwitch(
                          title: "Ähli",
                          // obj: _obj,
                        );
                      }
                      if (title == "Ýerleşýän ýeri") {
                        final _obj = widget.list[index - 1];
                        return SwitchListTile(
                            title: Text(_obj.name,
                                style: ThemeProvided().styleUserPage),
                            value: false,
                            onChanged: (bool _val) {
                              final List _etrabs =
                                  providerValues.etrapObjs(_obj.id - 1);
                              PopStateFull(
                                context: context,
                                list: _etrabs,
                                title: "Etrap",
                              ).pop;
                            });
                      } else {
                        final _obj = widget.list[index - 1];
                        return FilterSwitch(
                          JsonTag: widget.jsonTag,
                          title: _obj.name,
                          obj: _obj,
                        );
                      }
                    }),
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(8),
                      child: ElevatedButton(
                        child: Text('Ýatyr'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(8),
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Tamam")))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
