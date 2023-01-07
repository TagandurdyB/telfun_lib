import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Providers/EventProvider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/ValueProvider.dart';
import '../../ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/Plitcas.dart';
import '/Views/widgets/carusel_pro.dart';
import 'AddPages/AddPages.dart';
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
                Return: API_Get(
                  URL: "$IP/api/color",
                  ApiName: ApiTags.colors,
                  Return: API_Get(
                      URL: "$IP/api/welayat",
                      ApiName: ApiTags.place,
                      Return: API_Get(
                          URL: "$IP/api/etrap",
                          ApiName: ApiTags.etraps,
                          Return: Main())),
                ),
              ),
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
  List<Widget> _listMain = [];

  @override
  void initState() {
    super.initState();
    Provider.of<ValuesProvider>(context,listen: false).reload();
    selPage = TabController(vsync: this, length: 3);
    _listMain = [
      Slider_pro(),
      Categories(),
    ];
  }

  @override
  void dispose() {
    selPage.dispose();
    super.dispose();
  }

  Future<void> _refresh() {
    print("I am refreshing !!!");
    return Future.delayed(Duration(seconds: 1)).then((value) => _listMain = [
          Slider_pro(),
          Categories(),
        ]);
  }

  Widget build(BuildContext context) {
    // print(selPage);

    selPage.index = Provider.of<UsesVar>(context).witchNavBarSelect();
    return ScaffoldAll(
      IsSideBar: true,
      IsMain: true,
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: selPage,
          children: [
            Container(
              child: Container(
                child: Container(
                  child: RefreshIndicator(
                    backgroundColor: Color(0xff670FB1),
                    color: Colors.white,
                    onRefresh: _refresh,
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: _listMain,
                    ),
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
