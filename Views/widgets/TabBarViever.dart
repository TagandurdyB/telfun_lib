import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';

class TabViewer extends StatefulWidget {
  final List<Widget> childs;
  TabViewer({this.childs});
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
      children: widget.childs,
    );
  }
}