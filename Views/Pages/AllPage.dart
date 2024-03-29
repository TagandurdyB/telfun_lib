import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Providers/EventProvider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import '/Views/widgets/MarkScrol.dart';
import '/Views/widgets/InPlitca.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/Search.dart';
import 'package:provider/provider.dart';
import '/ViewModels/Routes.dart';

class AllPage extends StatefulWidget {
  @override
  _AllPageState createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  List list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reloadFavorite();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EventsProvid>(context, listen: false).reLoad();
      Provider.of<EventsProvid>(context, listen: false).fillMark();
    });
  }

  void reloadFavorite(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EventsFavoritProvid>(context, listen: false).reload();
    });
  }

  @override
  Widget build(BuildContext context) {
   final  provider = Provider.of<EventsFavoritProvid>(context);
   final eventProvider = Provider.of<EventsProvid>(context);
   final markProvider = Provider.of<UsesVar>(context);
    return ScaffoldAll(
      isSliver: true,
      EnableBotomMenu: true,
      appBarBottom: SearchBtn(isFilter: true,tag: RITags.rISearchEvent),
      topBarHeight: 0.45,
      ////////////////////////////////////////////////
      sliverBody: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopMark(context),
            Visibility(
              visible: eventProvider.markObjs.length > 0,
              child: MarkScrol(),
            ),
            ////////////////////////////////////////////////
            Container(
                //color: Colors.red,
                padding: EdgeInsets.symmetric(
                    horizontal: SWi * 0.06, vertical: SWi * 0.05),
                child: Text("Bildirişler",
                    style: TextStyle(
                        fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
          ],
        ),
      ),
      ////////////////////////////////////////////////
      sliverList: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          final int _mark_id = markProvider.getMark()[0];
          final int _sort_num = markProvider.sortNum;
          List _list = eventProvider.sortWithMarks(_mark_id, _sort_num,markProvider.getSearch);
          final obj = _list[index];
          //print("sakjdalsd++:=${obj.id}");
          return InCategory(
            obj: obj,
            isFavorite: provider.isExist(obj),
            favoriteFunc: (){
              reloadFavorite();
            },
          );
        },
            childCount: eventProvider
                .sortWithMarks(markProvider.getMark()[0], markProvider.sortNum,markProvider.getSearch)
                .length //Get_Lists(listTag: ApiTags.events).getList().length,
            ),
      ),
      ////////////////////////////////////////////////
    );
  }

  Row TopMark(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: SWi * 0.03),
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {
            Provider.of<UsesVar>(context,listen: false).changeSearch("");
            Provider.of<UsesVar>(context,listen: false).changeSort(0);
            Navigator.pushNamed(context, PageName.pageMark);
          },
          child: Text("Markalar",
              style: TextStyle(
                  fontSize: SWi * 0.05,
                  fontWeight: FontWeight.w800,
                  color: ThemeProvided().colorText)),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: ThemeProvided().colorText, width: 2),
            shape: StadiumBorder(),
          ),
        ),
      ),
      //  SortBtn(),
      Container(
        padding: EdgeInsets.symmetric(horizontal: SWi * 0.03),
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {
            //  fillFavorite(_events);
            Future.delayed(Duration(milliseconds: 1000))
                .then((value) => setState(() {}));
            Provider.of<UsesVar>(context, listen: false).changeMark(0, -1);
          },
          child: Text("Ählisi",
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
                width:
                    Provider.of<UsesVar>(context).getMark()[1] == -1 ? 2 : 1),
            shape: StadiumBorder(),
          ),
        ),
      ),
    ]);
  }
}

/*/marks/${Provider.of<UsesVar>(context, listen: false).getMark()[0]*/
