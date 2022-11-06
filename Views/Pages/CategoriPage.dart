import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';

import 'AllPage.dart';
import 'ModelPage.dart';
import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class CategoriPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      EnableBotomMenu: true,
        IsTabBar: true,
        myTabs: [
          Tab(text: 'Hemmesi'),
          Tab(text: 'Model'),
        ],
       // topBarHeight: 0.25,
        body: TabViewer());
  }
}

class TabViewer extends StatefulWidget {
  @override
  _TabViewerState createState() => _TabViewerState();
}



class _TabViewerState extends State<TabViewer>
    with SingleTickerProviderStateMixin {

  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 2);

  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    tabController.index=Provider.of<UsesVar>(context).witchSelect();
    return TabBarView(
      controller:tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        AllPage(),
        ModelPage(),
      ],
    );
  }
}

