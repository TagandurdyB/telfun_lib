import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/FilterProvider.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DDBBase.dart';
import 'package:telfun/Views/widgets/DropDownBtn/DropDownBtn.dart';
import 'package:telfun/Views/widgets/FilterSwitch.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

import 'FilterPop.dart';


class FilterFirstView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Json_Get(
      jsonName: JsonTags.filterMark,
      Return: Json_Get(
        jsonName: JsonTags.filterModel,
        Return: Json_Get(
          jsonName: JsonTags.filterColor,
          Return: Json_Get(
            jsonName: JsonTags.filterEtrap,
            Return: Json_Get(
              jsonName: JsonTags.filterPrice,
              Return: Json_Get(
                  jsonName: JsonTags.filterTime,
                  Return: FilterAddView()),
            ),
          ),
        ),
      ),
    );
  }
}


class FilterAddView extends StatefulWidget {
  // const SetingsPage({Key? key}) : super(key: key);
  @override
  _FilterAddViewState createState() => _FilterAddViewState();
}

class _FilterAddViewState extends State<FilterAddView> {
  DDBEl DDColor, DDMark, DDModel, DDPrice, DDEtrap, DDTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    erease();
    Provider.of<FilterProvider>(context, listen: false).reload();
  }

  void erease() {
    DDMark = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDModel = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDColor = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDEtrap = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDTime = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    DDPrice = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
  }

  void fill(BuildContext context) {

    Map _basa=Provider.of<FilterProvider>(context).filters;
    Map _basaApi=Provider.of<ValuesProvider>(context).allOfThem;
    List _listMark = _basa[JsonTags.filterMark];
    List _listModel = _basa[JsonTags.filterModel];
    List _listColor = _basa[JsonTags.filterColor];
    List _listPlace = _basa[JsonTags.filterEtrap];

    int _numMark = _listMark.length;
    int _numModel = _listModel.length;
    int _numColor = _listColor.length;
    int _numPlace = _listPlace.length;

    int _numMarkApi = _basaApi[ApiTags.mark].length;
    int _numModelApi = _basaApi[ApiTags.model].length;
    int _numColorApi = _basaApi[ApiTags.colors].length;
    int _numPlaceApi = _basaApi[ApiTags.etraps].length;

    final int _min=_basa[JsonTags.filterPrice][0];
    final int _max=_basa[JsonTags.filterPrice][1];

    final dDTime=_basa[JsonTags.filterTime][0];

    if (_numMark == 0)
      DDMark = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    else if (_numMark == 1)
      DDMark = DDBEl(index: -1, value: "${_listMark[0].name}", id: 0);
    else if (_numMark == _numMarkApi)
      DDMark = DDBEl(index: -1, value: "Ähli", id: 0);
    else
      DDMark = DDBEl(index: -1, value: "Marka ($_numMark)", id: 0);

    if (_numModel == 0)
      DDModel = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    else if (_numModel == 1)
      DDModel = DDBEl(index: -1, value: "${_listModel[0].name}", id: 0);
    else if (_numModel == _numModelApi)
      DDModel = DDBEl(index: -1, value: "Ähli", id: 0);
    else
      DDModel = DDBEl(index: -1, value: "Model ($_numModel)", id: 0);

    if (_numColor == 0)
      DDColor = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    else if (_numColor == 1)
      DDColor = DDBEl(index: -1, value: "${_listColor[0].name}", id: 0);
    else if (_numColor == _numColorApi)
      DDColor = DDBEl(index: -1, value: "Ähli", id: 0);
    else
      DDColor = DDBEl(index: -1, value: "Reňk ($_numColor)", id: 0);

    if (_numPlace == 0)
      DDEtrap = DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
    else if (_numPlace == 1)
      DDEtrap = DDBEl(index: -1, value: "${_listPlace[0].name}", id: 0);
    else if (_numPlace == _numPlaceApi)
      DDEtrap = DDBEl(index: -1, value: "Ähli", id: 0);
    else
      DDEtrap = DDBEl(index: -1, value: "Ýer ($_numPlace)", id: 0);

    if(_max>0)
      DDPrice=DDBEl(index: -1, value: "$_min TMT -> $_max TMT", id: 0);
    else
      DDPrice=DDBEl(index: -1, value: "Saýlanmadyk", id: 0);

    if(dDTime.id!=0)
      DDTime=dDTime;
    else
      DDTime=DDBEl(index: -1, value: "Saýlanmadyk", id: 0);
  }

  @override
  Widget build(BuildContext context) {
    final providerFilter = Provider.of<FilterProvider>(context);
    final providerValues = Provider.of<ValuesProvider>(context);
    fill(context);
    final TextStyle disable = Provider.of<ThemeProvided>(context).styleDisable;
    final TextStyle enable = Provider.of<ThemeProvided>(context).styleEnable;
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8),
              child: IconButton(
                onPressed: () {
                  FilterFuncGroup().ereareAll(context);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.orange,
                ),
                iconSize: SWi * 0.07,
              )),
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
                        apiTag: ApiTags.mark,
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
                final List _models = providerValues.modelObjs;
                //PopDrop(context, _models, "Modeller").popUp(context);
                PopStateFull(
                        context: context,
                        list: _models,
                        title: "Modeller",
                        apiTag: ApiTags.model,
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
                        apiTag: ApiTags.colors,
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
                              type: Type.num,
                              startVal: providerFilter.filter(JsonTags.filterPrice)[0].toString(),
                              /*RIBase.isEmpety(RITags.rIMin)
                                  ? "0"
                                  : RIBase.getText(RITags.rIMin),*/
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
                              type: Type.num,
                              startVal: providerFilter.filter(JsonTags.filterPrice)[1].toString(),
                              /*RIBase.isEmpety(RITags.rIMax)
                                  ? "0"
                                  : RIBase.getText(RITags.rIMax),*/
                              shape: true,
                              borderRad: 2,
                              label: "iň gymmat",
                              onChange: (_value, _tag) {},
                            ),
                          )),
                        ],
                      ),
                    ),
                    actionsTeam: [
                      ActionsTeam(
                          text: "SAÝLA",
                          func: () {
                            String subtitle;
                            final List _price = FilterFuncGroup().funcPrice(context);
                            final int _min = _price[0];
                            final int _max = _price[1];
                            if (_min >= _max)
                              subtitle = "Saýlanmadyk";
                            else
                              subtitle = "$_min TMT -> $_max TMT";
                            DDPrice.value=subtitle;
                          //  DDPrice.index=_min;
                          //  DDPrice.id=_max;
                            setState(() {});
                          })
                    ]).popUp(context);
              },
              title: Text(
                "Bahasy",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "${DDPrice.value}",
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
                PopStateFull(
                        context: context,
                        list: _place,
                        title: "Ýerleşýän ýeri",
                        apiTag: ApiTags.place,
                        jsonTag: JsonTags.filterPlace)
                    .pop;
              },
              title: Text(
                "Ýerleşýän ýeri",
                style: ThemeProvided().styleEnable,
              ),
              subtitle: Text(
                "${DDEtrap.value}",
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
                    //final List _time = FilterFuncGroup().funcTime(context);
                   // DDTime=_time[0];
                    setState(() {});
                    FilterFuncGroup().funcTime(context);
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
                  onPressed: () {
                    print(''''
${providerFilter.filterMaps()}
''');
                  },
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
                          onPressed: () {
                            PopUppWidget(
                                title: "Filtiriň Ady",
                                centerTitle: true,
                                content: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: ReadyInput(
                                        shape: true,
                                        tag: RITags.rIFilter,
                                        borderRad: 20,
                                        hidden: "Filteriň adyny ýazyň...",
                                        label: "Ad ber",
                                        onChange: (val, tag) {},
                                      ),
                                    ),
                                  ],
                                ),
                                actionsTeam: [
                                  ActionsTeam(func: () {}, text: "Ýatyr"),
                                  ActionsTeam(
                                      func: () {
                                        JsonListCacher(
                                                jsonName: JsonTags.filters)
                                            .addSaved({
                                          "name":
                                              "${RIBase.getText(RITags.rIFilter)}",
                                          "id": providerFilter
                                              .savedFilters.length,
                                          "filters":
                                              providerFilter.filterMaps(),
                                        });
                                        Provider.of<UsesVar>(context,
                                                listen: false)
                                            .Select(1);
                                      },
                                      text: "Goş"),
                                ]).popUp(context);
                          },
                          child: Text("ÝATDASAKLA")))),
            ],
          )
        ],
      ),
    );
  }
}
