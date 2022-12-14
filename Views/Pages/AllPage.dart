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

  var provider , eventProvider ,markProvider ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<EventsFavoritProvid>(context,listen: false).reload();
      Provider.of<EventsProvid>(context,listen: false).reLoad();
    });
  }


  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EventsFavoritProvid>(context);
    eventProvider = Provider.of<EventsProvid>(context);
     markProvider = Provider.of<UsesVar>(context);
    return ScaffoldAll(
      isSliver: true,
      EnableBotomMenu: true,
      appBarBottom: SearchBtn(),
      topBarHeight: 0.33,
        ////////////////////////////////////////////////
       sliverBody: SizedBox(
           height : SWi * 0.54,
           child: Column(
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
        ////////////////////////////////////////////////
       sliverList: SliverList(
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
