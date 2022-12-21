import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/ViewModels/UserProvider.dart';
import 'package:telfun/Views/Pages/ProductPage.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import '/Models/Public.dart';
import '/ViewModels/Routes.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/widgets/Dialog.dart';
import '../widgets/ReadyInput/ReadyInput.dart';
import '/Views/widgets/imgBtn.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return API_Get(
      URL: "$IP/api/all/${UserProperties.getProperty("id")}",
      ApiName: ApiTags.all,
      Return: API_Get(
        URL: "$IP/api/success/${UserProperties.getProperty("id")}",
        ApiName: ApiTags.product,
        Return: API_Get(
          URL: "$IP/api/onproses/${UserProperties.getProperty("id")}",
          ApiName: ApiTags.prosses,
          Return: Json_Get(
            jsonName: JsonTags.favorite,
            Return: Container(
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 0,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                              color: Colors.grey)
                        ],
                        color: ThemeProvided().colorCanvas,
                      ),
                      height: 100,
                      width: SWi,
                      padding: EdgeInsets.symmetric(horizontal: SWi * 0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            child: Text(
                              "${UserProperties.getProperty("name")[0].toUpperCase()}",
                              style: TextStyle(
                                  fontSize: SWi * 0.06, color: Colors.white),
                            ),
                            radius: SWi * 0.06,
                            backgroundColor: Color(0xff5408BF),
                          ),
                          SizedBox(width: SWi * 0.05),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${UserProperties.getProperty("name")}",
                                style: TextStyle(fontSize: SWi * 0.05),
                              ),
                              Text(
                                "${UserProperties.getProperty("phone")}",
                                style: TextStyle(fontSize: SWi * 0.037),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        // Container(width: SWi, height: 100, color: Colors.transparent),
                        Builder(builder: (context) {
                          //  Provider.of<UserProvider>(context).fillProfile();
                          return MyProfil();
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyProfil extends StatelessWidget {
  //const MyProfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: ThemeProvided().colorCanvas,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: SWi * 0.02),
            padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
            child: ListTile(
              onTap: () => Navigator.pushNamed(context, PageName.pageFavorite),
              leading: ImgBtn(
                  width: SWi * 0.11,
                  height: SWi * 0.11,
                  shape: SWi * 0.02,
                  color: Color(0xff5408BF),
                  child: Icon(Icons.bookmark_border, color: Colors.white)),
              title: Text(
                "Bellänlerim",
                style: ThemeProvided().styleUserPage,
              ),
              trailing: Text(
                  "${Provider.of<EventsFavoritProvid>(context).objs.length}"),
              //Text("${Provider.of<EventsFavoritProvid>(context).objs.length}"),
            ),
          ),
        ),
        Card(
          color: ThemeProvided().colorCanvas,
          child: Column(
            children: [
              Container(
                child: Text(
                  "Meniň bildirişlerim",
                  style: TextStyle(
                      fontSize: SWi * 0.05,
                      color: Color(0xff5408BF),
                      fontWeight: FontWeight.w700),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: SWi * 0.1, vertical: SWi * 0.05),
              ),
              iconBox(
                "Ähli bildirişlerim",
                "Ähli",
                Icons.all_inbox,
                //Provider.of<UserProvider>(context).allObjs,
                Get_Lists(listTag: ApiTags.all).getList(),
                Get_Lists(listTag: ApiTags.all).getList().length,
              ),
              iconBox(
                "Ullanylan Bildirişlerim",
                "Ulanylan",
                Icons.label,
                //Provider.of<UserProvider>(context).oldObjs,
                Get_Lists(listTag: ApiTags.product)
                    .getList()
                    .where((element) => !element.is_new)
                    .toList(),
                Get_Lists(listTag: ApiTags.product)
                    .getList()
                    .where((element) => !element.is_new)
                    .length,
              ),
              iconBox(
                "Täze Bildirişlerim",
                "Täze",
                Icons.fiber_new,
                //Provider.of<UserProvider>(context).newObjs,
                Get_Lists(listTag: ApiTags.product)
                    .getList()
                    .where((element) => element.is_new).toList(),
                Get_Lists(listTag: ApiTags.product)
                    .getList()
                    .where((element) => element.is_new)
                    .length,
              ),
              iconBox(
                "Tassyklanmagyna Garaşylýan",
                "Garaşylýan",
                Icons.timer,
                //Provider.of<UserProvider>(context).prossesObjs,
                Get_Lists(listTag: ApiTags.prosses).getList(),
                Get_Lists(listTag: ApiTags.prosses).getList().length,
              ),
            ],
          ),
        ),
        Card(
          color: ThemeProvided().colorCanvas,
          child: Column(
            children: [
              Container(
                child: Text(
                  "Sazlamalar",
                  style: TextStyle(
                      fontSize: SWi * 0.05,
                      color: Color(0xff5408BF),
                      fontWeight: FontWeight.w700),
                ),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: SWi * 0.1, vertical: SWi * 0.05),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () => PopUppWidget(
                      title: "Ad",
                      content: ReadyInput(
                        shape: true,
                        //index: 3,
                        tag: RITags.rIUserName,
                        borderRad: 20,
                        hidden: "Adyňyzy ýazyň...",
                        label: "Täze ad",
                        /* onControl: (val, index) {
                          },*/
                      ),
                      actionsTeam: [
                        ActionsTeam(func: () {}, text: "Ýatyr"),
                        ActionsTeam(
                            func: () {
                              ///////change name from api
                              ///////
                              ShPUser(
                                      id: int.parse(
                                          UserProperties.getProperty("id")),
                                      name: RIBase.getText(RITags.rIUserName),//controls[3].text,
                                      phone:
                                          UserProperties.getProperty("phone"),
                                      isban: int.parse(
                                          UserProperties.getProperty("isban")),
                                      token:
                                          UserProperties.getProperty("token"))
                                  .sava();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  PageName.pageMain, (route) => route.isFirst);
                            },
                            text: "Üýtget",
                            isPopEnable: false),
                      ]).popUpCupertino(context),
                  leading: iconBloc(Icons.edit),
                  title: Text(
                    "Ady üýtgetmek",
                    style: ThemeProvided().styleUserPage,
                  ),
                  //trailing: Text("0"),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: SWi * 0.02),
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () => PopUppWidget(
                      title: "Parol",
                      content: ReadyInput(
                        shape: true,
                        tag: RITags.rIUserPass,
                        //index: 4,
                        borderRad: 20,
                        hidden: "Paroly ýazyň...",
                        label: "Täze Parol",
                        /* onControl: (val, index) {
                          },*/
                      ),
                      actionsTeam: [
                        ActionsTeam(func: () {}, text: "Ýatyr"),
                        ActionsTeam(
                            func: () {
                              ///////change pass from api
                              ///////
                              Navigator.pushNamedAndRemoveUntil(context,
                                  PageName.pageMain, (route) => route.isFirst);
                            },
                            text: "Üýtget",
                            isPopEnable: false),
                      ]).popUpCupertino(context),
                  leading: ImgBtn(
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Padding(
                        padding: EdgeInsets.only(top: SWi * 0.02),
                        child: Text(
                          "***",
                          style: TextStyle(
                              color: Colors.white, fontSize: SWi * 0.05),
                        ),
                      )),
                  title: Text(
                    "Paroly üýtgetmek",
                    style: ThemeProvided().styleUserPage,
                  ),
                  //trailing: Text("0"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () {
                    UserProperties.erase();
                    Provider.of<UsesVar>(context, listen: false)
                        .navBarSelect(0);
                    Navigator.pushNamedAndRemoveUntil(
                        context, PageName.pageMain, (route) => false);
                  },
                  leading: iconBloc(Icons.logout),
                  title: Text(
                    "Ulgamdan çykmak",
                    style: ThemeProvided().styleUserPage,
                  ),
                  //trailing: Text("0"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget iconBox(String titleProduct, String title, IconData icon,
      List<dynamic> objs, int sum) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
      margin: EdgeInsets.symmetric(vertical: SWi * 0.01),
      child: Builder(
        builder: (context) => ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(
                        title: titleProduct,
                        objs: objs,
                      ))),
          leading: iconBloc(icon),
          title: Text(
            title,
            style: ThemeProvided().styleUserPage,
          ),
          trailing: Text("${sum}"),
        ),
      ),
    );
  }

  Widget iconBloc(IconData icon) {
    return Container(
      child: ImgBtn(
          width: SWi * 0.11,
          height: SWi * 0.11,
          shape: SWi * 0.02,
          color: Color(0xff5408BF),
          child: Icon(icon, color: Colors.white)),
    );
  }
}
