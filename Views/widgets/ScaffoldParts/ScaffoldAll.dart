import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/Models/Public.dart';
import 'MyAppBar.dart';
import 'MyDrawer.dart';
import 'MyFloatingActionButton.dart';
import 'MyNavBar.dart';

class ScaffoldAll extends StatelessWidget {
  final Widget body, title;
  final List<Tab> myTabs;
  final Function onFloatTop;
  final String phone;
  final bool IsAdd,
      IsUser,
      IsSideBar,
      IsTabBar,
      IsMain,
      EnableBotomMenu,
      IsFloatBtn;
  final double topBarHeight;
  ScaffoldAll(
      {Key key,
      @required this.body,
      this.title,
      this.IsAdd = false,
      this.IsUser = false,
      this.IsSideBar = false,
      this.IsTabBar = false,
      this.myTabs,
      this.topBarHeight = 0.15,
      this.IsMain = false,
      this.EnableBotomMenu = false,
      this.IsFloatBtn = false,
      this.onFloatTop, this.phone})
      : super(key: key);

/*  List<Tab> myTabs = <Tab>[
    Tab(text: 'page1.'),
    Tab(text: 'page2.'),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SWi * topBarHeight),
          child: PreferredSize(
            child: MyAppBar(
                IsSideBar: IsSideBar,
                myTabs: myTabs,
                title: title != null ? title : telfun,
                IsTabBar: IsTabBar,
                IsUser: IsUser),
          )),
      // drawer: IsSideBar ? MyDrawer(context: context) : null,
      drawer: MyDrawer(context: context),
     // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
     // floatingActionButton: IsFloatBtn ? MyFloatingActionButton(phone: phone) : null,
      bottomNavigationBar: MyBottomNavBar(
        phone: phone,
        IsFloatBtn:IsFloatBtn,
        IsAdd: IsAdd,
        IsUser: IsUser,
        IsMain: IsMain,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Builder(
        builder: (context) => Column(
          children: [
            Visibility(
              visible: EnableBotomMenu,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 17),
                          //  color: Colors.red,
                          child: GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Icon(Icons.menu))),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: SWi * 0.03),
                        child: Text(
                          "${EnableBotomMenu ? Get_Lists(listTag: ApiTags.categori).getList()[Provider.of<UsesVar>(context).getCategoryIndex()].tm : ""}",
                          style: TextStyle(
                              fontSize: SWi * 0.045,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.sort_by_alpha,
                            color: Color(0xff8017FF),
                            size: SWi * 0.07,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, PageName.pageFavorite);
                            },
                            child: Icon(
                              Icons.bookmark,
                              color: Color(0xff8017FF),
                              size: SWi * 0.07,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: body,
                width: SWi,
              ),
            )
          ],
        ),
      ),
    );
  }
}
