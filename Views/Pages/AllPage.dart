import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List list;
  List favorites, events = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    events = Get_Lists(listTag: ApiTags.events)
            .getList() /*.forEach((element) {
       events.addAll(element);
     })*/
        ;
    print("initState");
    watchAll(events);
  }

  void watchAll(List _val) {
    favorites = Get_Lists(isApi: false, listTag: JsonTags.favorite).getList();
    if (favorites.isNotEmpty) {
      List _events = _val;
      /*favorites.forEach((element) {
        if(element.index<_events.length)
          if(_events[element.index].id==element.id)
          _events[element.index].favorite = true;
      });*/
/*      _events.forEach((element) {
        favorites.forEach((elementFavorite) {
          if(element.id==elementFavorite.id)
            _events[element.index].favorite = true;
        });
      });*/
      for (int i = 0; i < _events.length; i++) {
        for (int j = 0; j < favorites.length; j++) {
          if (favorites[j].id == _events[i].id) {
            _events[i].favorite = true;
          }
        }
      }
      print("favorite IsNot empety!!!");
      _events.forEach((element) {
        print("${element.favorite}  ${element.name}  ${element.id}");
      });
      list = _events;
    } else {
      print("favorite empety!!!");
      events.forEach((element) {
        print("${element.favorite}  ${element.name}  ${element.id}");
      });
      list = events;
    }
  }

  @override
  Widget build(BuildContext context) {
    events.forEach((element) {
      print("sajkdah Is_new:${element.is_new}   id:${element.id}");
    });
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
          expandedHeight: SWi*0.54,
          flexibleSpace:  FlexibleSpaceBar(
            background: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                      watchAll(events);
                      setState(() {});
                      Provider.of<UsesVar>(context, listen: false).changeMark(-1, -1);
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
                          width: Provider.of<UsesVar>(context).getMark()[1] == -1
                              ? 2
                              : 1),
                      shape: StadiumBorder(),
                    ),
                  ),
                ),
              ]),
              Visibility(
                visible: Get_Lists(listTag: ApiTags.mark).getList().length > 0,
                child: MarkScrol(
                  onTab: () {
                    List _list = events
                        .where((element) =>
                    element.mark_id ==
                        Provider.of<UsesVar>(context, listen: false).getMark()[0])
                        .toList();
                    watchAll(_list);
                    //list = _list;
                    Future.delayed(Duration(milliseconds: 50)).then((value) {
                      setState(() {});
                    });
                  },
                ),
              ),
              Container(
                //color: Colors.red,
                  padding: EdgeInsets.symmetric(
                      horizontal: SWi * 0.06, vertical: SWi * 0.05),
                  child: Text("Bildirişler",
                      style: TextStyle(
                          fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
            ],),
          ),
        ),
        ////////////////////////////////////////////////
        SliverList(
         // alignment: Alignment.center,
          //height: 100,
          // width: 100,
          delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index)=>
            InCategory(
              list: list,
              index: index,
            ),
        childCount: list.length,
                   ),
        ),

      ]),
    );
  }
}

/*/marks/${Provider.of<UsesVar>(context, listen: false).getMark()[0]*/
