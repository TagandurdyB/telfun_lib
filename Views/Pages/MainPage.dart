import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/Plitcas.dart';
import '/Views/widgets/carusel_pro.dart';
import 'AddPages.dart';
import '../widgets/ScaffoldParts/ScaffoldAll.dart';
import 'UserPage.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get_api(
        URL: "$IP/api/images",
        ApiName: Get_Lists.img,
        Return: Get_api(
            URL: "$IP/api/marks",
            ApiName: Get_Lists.mark,
            Return: Get_api(
              URL: "$IP/api/model",
              ApiName: Get_Lists.model,
              Return: Get_api(
                  URL: "$IP/api/categories",
                  ApiName: Get_Lists.categori,
                  Return: Main()),
            )));
  }
}

class Main extends StatefulWidget {
  const Main({
    Key key,
  }) : super(key: key);
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  @override
  TabController selPage;
  @override
  void initState() {
    super.initState();
    selPage = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    selPage.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // print(selPage);
    selPage.index = Provider.of<UsesVar>(context).witchNavBarSelect();
    return ScaffoldAll(
      IsSideBar: true,
      /*  IsTabBar: Provider.of<UsesVar>(context).witchNavBarSelect()==1,
        topBarHeight: Provider.of<UsesVar>(context).witchNavBarSelect()==1?0.25:0.15,
      myTabs: [
        Tab(text: 'Hemmesi'),
        Tab(text: 'Model'),
      ],*/
      IsMain: true,
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: selPage,
          children: [
            Container(
              child: Container(
                child: Container(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      //MySlider1(),
                      // MySlider(),
                      Slider_pro(),
                      Categories(),
                    ],
                  ),
                ),
              ),
            ),
            AddPage(),
            UserPage(),
          ]),
    );
  }
}
