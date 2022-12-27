import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DropDownBtn.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class SearchPage extends StatefulWidget {
  // const SetingsPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DDBEl DDColor, DDMark, DDModel, DDPlace, DDTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    erease();
  }

  void erease() {
    DDColor = DDBEl(index: -1, value: "Saýlanmadyk",id:0);
    DDMark = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDModel = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDPlace = DDBEl(index: -1, value: "Saýlanmadyk",id:0);
    DDTime= DDBEl(index: -1, value: "Saýlanmadyk",id:0);
  }

  @override
  Widget build(BuildContext context) {
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
                final List _marks = Get_Lists(listTag: ApiTags.mark).getList();
                PopDrop(context,_marks,"Markalar").popUp(context);
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
                final List _models = Get_Lists(listTag: ApiTags.model).getList();
                PopDrop(context,_models,"Modeller").popUp(context);
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
                final List _colors = Get_Lists(listTag: ApiTags.colors).getList();
                PopDrop(context,_colors,"Reňki").popUp(context);
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
                final List _place = Get_Lists(listTag: ApiTags.place).getList();
                PopDrop(context,_place,"Ýerleşýän ýeri").popUp(context);
               // final List _place = Get_Lists(listTag: ApiTags.place).getList();
                PopDrop(context,_place,"Ýerleşýän ýeri").popUp(context);
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

  PopUppWidget PopDrop(BuildContext context,List<dynamic> _list, String _title) {
    String _name="";
    return PopUppWidget(
        content: Column(
          children: List.generate(_list.length + 1, (index) {
            var _obj;
            if(index!=0)
              _obj = _list[index - 1];
            if(_title!="Reňki")
            _name=index!=0?_obj.name:"Ähli";
            else
              _name=index!=0?_obj.tm:"Ähli";
              return Column(
                children: [
                  ImgBtn(
                    onTap: () {
                      if(_title=="Markalar") {
                        DDMark.value = index != 0 ? _obj.name : "Ähli";
                        DDMark.id = index != 0 ? _obj.id : 0;
                        DDMark.index = 0;
                      }else if(_title=="Modeller") {
                        DDModel.value = index != 0 ? _obj.name : "Ähli";
                        DDModel.id = index != 0 ? _obj.id : 0;
                        DDModel.index = 0;
                      }else if(_title=="Reňki") {
                        DDColor.value = index != 0 ? _obj.tm : "Ähli";
                        DDColor.id = index != 0 ? _obj.id : 0;
                        DDColor.index = 0;
                      }else if(_title=="Ýerleşýän ýeri") {
                        DDPlace.value = index != 0 ? _obj.name : "Ähli";
                        DDPlace.id = index != 0 ? _obj.id : 0;
                        DDPlace.index = 0;
                      }
                      setState(() {});
                      Navigator.pop(context);
                    },
                    width: double.infinity,
                    height: SWi * 0.1,
                    color: Colors.transparent,
                    child: Text(
                      "$_name",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: SWi * 0.033),
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
}
