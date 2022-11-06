import 'package:flutter/material.dart';
import '/Models/Public.dart';
import 'MyAppBar.dart';
import 'MyDrawer.dart';
import 'MyNavBar.dart';

class ScaffoldAll extends StatelessWidget {
  final Widget body, title;
  final List<Tab> myTabs;
  final bool IsAdd, IsUser, IsSideBar, IsTabBar, IsMain, EnableBotomMenu;
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
      this.EnableBotomMenu = false})
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
      bottomNavigationBar: MyBottomNavBar(
        IsAdd: IsAdd,
        IsUser: IsUser,
        IsMain: IsMain,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButton: MyFloatingActionButton(),
      body: Builder(
        builder:(context)=> Column(
          children: [
            Visibility(
              visible: EnableBotomMenu,
              child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 17),
                    //  color: Colors.red,
                    child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(Icons.menu))),

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

  FloatingActionButton MyFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }
}
