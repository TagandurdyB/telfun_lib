import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import '/Models/Public.dart';
import '/Views/widgets/TabBarViever.dart';
import '/Views/widgets/imgBtn.dart';

import 'AddNewPage.dart';
import 'AddOldPage.dart';
import '../AllPage.dart';
import '../ModelPage.dart';

class AddPage extends StatelessWidget {
  // AddPage({}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
                      },
                      child: Text(
                        "Ulanylan",
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
                        Provider.of<UsesVar>(context, listen: false).changeCanAdd(false);
                      },
                      child: Text(
                        "Täze",
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
                          (Provider.of<UsesVar>(context)
                                      .witchSelect() *
                                  0.4 +
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
              AddOldPage(),
               AddNewPage(),
            ]),
          )
          /* RangeSlider(
            values: RangeValues(5, 10),
            onChanged: (value) {},
            max: 10,
            min: 0,
            activeColor: Colors.red,
            inactiveColor: Colors.grey[300],
            labels: RangeLabels(
             "5",
             "10",
            ),
            onChangeStart: (value){
              print("started!!!");
            },

          )*/
        ],
      ),
    );
  }
}
