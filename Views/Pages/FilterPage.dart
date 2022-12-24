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

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class SearchPage extends StatefulWidget {
  // const SetingsPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DDBEl DDCategory = DDBEl(index: 0, id: 1, value: "Hemmesi");

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
              title: Text(
                "Markalar we modeller",
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
              title: Text(
                "Reňki",
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
                print("salam");
                PopUppWidget(
                  title: "Bahasy",
                  content: Container(child: Row(children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ReadyInput(
                        tag: RITags.rIMin,
                        label: "iň arzan",
                        shape: true,
                        borderRad: 2,
                        onChange: (_value,_tag){

                        },
                      ),
                    )),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ReadyInput(
                        tag: RITags.rIMax,
                        shape: true,
                        borderRad: 2,
                        label: "iň gymmat",
                        onChange: (_value,_tag){

                        },
                      ),
                    )),
                  ],),),
                  actionsTeam: [
                    ActionsTeam(text: "SAÝLA")
                  ]
                ).popUp(context);
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
              title: Text(
                "Ýerleşýän ýeri",
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
                            child: Text(DDCategory.value, style: enable)),
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
                    DDCategory = _element;
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
}
