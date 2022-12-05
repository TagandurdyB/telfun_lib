import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
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

  void fillFavorite(List _val) {
    final favoriteProvider = Provider.of<EventsFavoritProvid>(context);
    //List _events=eventProvider.objs;*/
    if (favoriteProvider.objs.isNotEmpty) {
      for (int i = 0; i < _val.length; i++) {
        List _favorite = favoriteProvider.objs;
        for (int j = 0; j < _favorite.length; j++) {
          if (_favorite[j].id == _val[i].id) {
            _val[i].changeFavorite(true);
            _favorite.removeAt(j);
            break;
          }
        }
      }
      list = _val;
    } else {
      final eventProvider = Provider.of<EventsProvid>(context);
      list = eventProvider.objs;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fillFavorite(new Get_Lists(listTag: ApiTags.events).getList());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsFavoritProvid>(context);
    final eventProvider = Provider.of<EventsProvid>(context);
    final markProvider = Provider.of<UsesVar>(context);
    // fillFavorite(eventProvider.objs);
    eventProvider.changeEventList(Get_Lists(listTag: ApiTags.events).getList());
    return ScaffoldAll(
      EnableBotomMenu: true,
      appBarBottom: SearchBtn(),
      topBarHeight: 0.33,
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        ////////////////////////////////////////////////
        SliverAppBar(
          leading: SizedBox(),
          pinned: false,
          snap: false,
          floating: false,
          expandedHeight: SWi * 0.54,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopMark(context),
                Visibility(
                  visible:
                      Get_Lists(listTag: ApiTags.mark).getList().length > 0,
                  child: MarkScrol(
                    onTab: () {
                      /*  List _list = eventProvider.objs
                          .where((element) =>
                              element.mark_id ==
                              Provider.of<UsesVar>(context, listen: false)
                                  .getMark()[0])
                          .toList();
                     // fillFavorite(_list);
                      Future.delayed(Duration(milliseconds: 50)).then((value) {
                        setState(() {});
                      });*/
                    },
                  ),
                ),
                ////////////////////////////////////////////////
                Container(
                    //color: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: SWi * 0.06, vertical: SWi * 0.05),
                    child: Text("Bildirişler",
                        style: TextStyle(
                            fontSize: SWi * 0.05,
                            fontWeight: FontWeight.w800))),
              ],
            ),
          ),
        ),
        ////////////////////////////////////////////////
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final int _mark_id = markProvider.getMark()[0];
            return InCategory(
              // list: Provider.of<UsesVar>(context).getEvent(),
              // index: index,
              obj: eventProvider.sortWithMarks(_mark_id)[
                  index], //  Get_Lists(listTag: ApiTags.events).getList()[index],
              isFavorite: provider
                  .isExist(eventProvider.sortWithMarks(_mark_id)[index]),
              // isFavorite: true,
            );
          },
              childCount: eventProvider
                  .sortWithMarks(markProvider.getMark()[0])
                  .length //Get_Lists(listTag: ApiTags.events).getList().length,
              ),
        ),
        ////////////////////////////////////////////////
      ]),
    );
  }

  Row TopMark(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: SWi * 0.03),
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, PageName.pageMark);
          },
          child: Text("Markalar",
              style: TextStyle(
                  fontSize: SWi * 0.05,
                  fontWeight: FontWeight.w800,
                  color: Colors.black)),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black, width: 2),
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
