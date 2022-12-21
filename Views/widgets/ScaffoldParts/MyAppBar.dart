import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/Models/Public.dart';
import '/Views/Pages/FilterPage.dart';
import '/Views/Pages/SetingsPage.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key key,
    @required this.myTabs,
    @required this.title,
    this.IsTabBar,
    this.IsUser, this.IsSideBar=false,
  }) : super(key: key);

  final List<Tab> myTabs;
  final Widget title;
  final bool IsTabBar, IsUser,IsSideBar;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: widget.myTabs == null ? 0 : widget.myTabs.length);
    tabController.addListener(() {
      Provider.of<UsesVar>(context, listen: false).Select(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Provider.of<ThemeProvided>(context).ststusBrightness,
leading: !widget.IsSideBar?BackButton():null,
     /////////////////////////////////////
      bottom: widget.IsTabBar
          ? PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Container(
                padding: EdgeInsets.only(left: SWi * 0.06, right: SWi * 0.06),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  tabs: widget.myTabs,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(color: Colors.red),
                ),
              ),
            )
          : null,
      ////////////////////////////////////
      //
      elevation: 0,
      shadowColor: Colors.white,
/*      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(SWi * 0.08))),*/
      backgroundColor: ThemeProvided().colorCanvas,
      title: widget.title,
      centerTitle: true,
/*      actions: [
        IconButton(
            onPressed: () {
              if (widget.IsUser) {
                Navigator.of(context).pushNamed(PageName.pageSetting);
              } else {
                Navigator.of(context).pushNamed(PageName.pageSearch);
              }
            },
            icon: Icon(
              widget.IsUser ? Icons.settings : Icons.search,
            ))
      ],*/
    );
  }
}


class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({
    Key key,
    @required this.myTabs,
    @required this.title,
    this.IsTabBar,
    this.IsUser, this.IsSideBar=false,
  }) : super(key: key);

  final List<Tab> myTabs;
  final Widget title;
  final bool IsTabBar, IsUser,IsSideBar;

  @override
  _MySliverAppBarState createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: widget.myTabs == null ? 0 : widget.myTabs.length);
    tabController.addListener(() {
      Provider.of<UsesVar>(context, listen: false).Select(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !widget.IsSideBar?BackButton():null,
      /////////////////////////////////////
      bottom: widget.IsTabBar
          ? PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: Container(
          padding: EdgeInsets.only(left: SWi * 0.06, right: SWi * 0.06),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            controller: tabController,
            tabs: widget.myTabs,
            labelColor: Colors.black,
            labelStyle: TextStyle(color: Colors.red),
          ),
        ),
      )
          : null,
      ////////////////////////////////////
      //
      elevation: 0,
      shadowColor: Colors.white,
/*      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.vertical(bottom: Radius.circular(SWi * 0.08))),*/
      backgroundColor: Colors.white,
      title: widget.title,
      centerTitle: true,
/*      actions: [
        IconButton(
            onPressed: () {
              if (widget.IsUser) {
                Navigator.of(context).pushNamed(PageName.pageSetting);
              } else {
                Navigator.of(context).pushNamed(PageName.pageSearch);
              }
            },
            icon: Icon(
              widget.IsUser ? Icons.settings : Icons.search,
            ))
      ],*/
    );
  }
}