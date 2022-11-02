import 'package:flutter/material.dart';
import '/Models/Public.dart';
import 'MyAppBar.dart';
import 'MyDrawer.dart';
import 'MyNavBar.dart';

class ScaffoldAll extends StatelessWidget {
  final Widget body, title;
  final List<Tab> myTabs;
  final bool IsAdd, IsUser, IsSideBar, IsTabBar,IsMain;
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
        this.topBarHeight = 0.15, this.IsMain=false})
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
                myTabs: myTabs,
                title: title != null ? title : telfun,
                IsTabBar: IsTabBar,
                IsUser:IsUser),
          )),
      drawer: IsSideBar ? MyDrawer(context: context) : null,
      bottomNavigationBar: MyBottomNavBar(IsAdd: IsAdd, IsUser: IsUser,IsMain: IsMain,),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButton: MyFloatingActionButton(),
      body: body,
    );
  }

  FloatingActionButton MyFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

}


