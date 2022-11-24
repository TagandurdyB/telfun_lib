import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import '../../ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Routes.dart';
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
    return API_Get(
        URL: "$IP/api/images",
        ApiName: ApiTags.img,
        Return: API_Get(
            URL: "$IP/api/marks",
            ApiName: ApiTags.mark,
            Return: API_Get(
              URL: "$IP/api/model",
              ApiName: ApiTags.model,
              Return: API_Get(
                  URL: "$IP/api/categories",
                  ApiName: ApiTags.categori,
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
                    /*  OutlinedButton(
                        onPressed:(){
                          Navigator.pushNamed(context, PageName.pageMark);
                        },
                        child: Text('Button'),
                      ),*/
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
