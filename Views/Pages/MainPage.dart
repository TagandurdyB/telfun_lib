import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/Plitcas.dart';
import '/Views/widgets/carusel_pro.dart';
import 'AddPage.dart';
import '../widgets/ScaffoldParts/ScaffoldAll.dart';
import 'UserPage.dart';

class MainPage extends StatelessWidget {
  static String routName = "/MainPage";
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get_api(
        URL: "$IP/api/images",
        ApiName: Get_Lists.img,
        Return: Get_api(
            URL: "$IP/api/categories",
            ApiName: Get_Lists.categori,
            Return: Get_api(
                URL: "$IP/api/marks",
                ApiName: Get_Lists.mark,
                Return: Main())));
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
      IsMain: true,
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: selPage,
          children: [
            Container(
              child: Container(child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Visibility(
                      visible: UserLoginDetals.getIsLogin(),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Baş sahypa",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "ProximaSoftBold")),
                                  Text("Hoş geldiňiz",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400)),
                                  Text(
                                      UserLoginDetals.getIsLogin()
                                          ? "${UserProperties.getProperty("name")}"
                                          : "",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontFamily: "ProximaSoftBold")),
                                ]),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor: Colors.deepPurple,
                                  child: Text(UserLoginDetals.getIsLogin()
                                      ? "${UserProperties.getProperty("name")[0].toUpperCase()}"
                                      : "",style:TextStyle(fontSize: 24))),
                            )
                          ],
                        ),
                      ),
                    ),
                    //MySlider1(),
                    // MySlider(),
                    Slider_pro(),
                    Categories(),
                  ],
                ),
              ),),
            ),
            AddPage(),
            UserPage(),
          ]),
    );
  }
}
