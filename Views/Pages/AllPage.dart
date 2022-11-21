import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import '/Views/widgets/MarkScrol.dart';
import '/Views/widgets/InPlitca.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/Search.dart';
import 'package:provider/provider.dart';
import '/ViewModels/Routes.dart';

class AllPage extends StatelessWidget {
  final int category_id;
  AllPage({this.category_id});
  @override
  Widget build(BuildContext context) {
    List list = Get_Lists(apiName: ApiTags.events).getList();
    return ScaffoldAll(
      EnableBotomMenu: true,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SearchBtn(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                padding: EdgeInsets.only(left: SWi * 0.06),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageName.pageMark);
                  },
                  child: Text("Markalar",
                      style: TextStyle(
                          fontSize: SWi * 0.05,
                          fontWeight: FontWeight.w800,
                          color: Colors.black)),
                )),
            //  SortBtn(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: SWi * 0.03),
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: () {
                  Provider.of<UsesVar>(context, listen: false)
                      .changeMark(-1, -1);
                },
                child: Text("Hemmesini görmek",
                    style: TextStyle(
                        color: Provider.of<UsesVar>(context).getMark()[1] == -1
                            ? Color(0xff9747FF)
                            : Colors.grey,
                        fontSize: SWi * 0.035)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: Provider.of<UsesVar>(context).getMark()[1] == -1
                          ? Color(0xff9747FF)
                          : Colors.grey,
                      width: Provider.of<UsesVar>(context).getMark()[1] == -1
                          ? 2
                          : 1),
                  shape: StadiumBorder(),
                ),
              ),
            ),
          ]),

          Visibility(
            visible: Get_Lists(apiName: ApiTags.mark).getList().length > 0,
            child: MarkScrol(),
          ),
          //
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SWi * 0.06, vertical: SWi * 0.06),
              child: Text("Bildirişler",
                  style: TextStyle(
                      fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
          /*  Get_api(
              URL: "$IP/api/category/$category_id}",
              //  URL: "$IP/api/category/$categoriId/marks/13",
              ApiName: ApiTags.events,
              Return: */
          Container(
            alignment: Alignment.center,
            //height: 100,
            // width: 100,
            child: Column(
                // spacing: SWi * 0.02,
                //runSpacing: SWi * 0.04,
                children: List.generate(
                    list.length,
                    (index) => InCategory(
                          list: list,
                          index: index,
                        ))),
          ),
        ],
      ),
    );
  }
}

/*/marks/${Provider.of<UsesVar>(context, listen: false).getMark()[0]*/
