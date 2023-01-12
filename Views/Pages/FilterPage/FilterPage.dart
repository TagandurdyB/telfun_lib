import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Views/Pages/FilterPage/FilterListView.dart';
import 'package:telfun/Views/widgets/TabBarViever.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

import '../../widgets/ScaffoldParts/ScaffoldAll.dart';
import 'FilterAddView.dart';

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
            jsonName: JsonTags.filterEtrap,
            Return: Json_Get(
              jsonName: JsonTags.filterPrice,
              Return: Json_Get(
                  jsonName: JsonTags.filterTime,
                  Return: FilterView()),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: SWi * 0.1),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Provider.of<UsesVar>(context, listen: false)
                              .Select(0);
                          Provider.of<UsesVar>(context, listen: false)
                              .changeCanAdd(false);
                        },
                        child: Text(
                          "Filtirler",
                          style: ThemeProvided().styleUserPage,
                        ),
                      )),
                      Expanded(
                          child: FlatButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          Provider.of<UsesVar>(context, listen: false)
                              .Select(1);
                          Provider.of<UsesVar>(context, listen: false)
                              .changeCanAdd(false);
                        },
                        child: Text(
                          "Taýýar",
                          style: ThemeProvided().styleUserPage,
                        ),
                      )),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: SWi *
                            (Provider.of<UsesVar>(context).witchSelect() * 0.4 +
                                0.1) /*0.1-0.5*/),
                    //Alignment.centerRight//,
                    child: ImgBtn(
                      shape: 2,
                      color: Color(0xffB47FFF),
                      width: SWi * 0.2,
                      height: 3,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: TabViewer(childs: [
                FilterAddView(),
                FilterListView(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
