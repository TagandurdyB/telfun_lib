import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/UserProvider.dart';
import 'package:telfun/Views/Pages/ProductPage.dart';
import '/Models/Public.dart';
import '/ViewModels/Routes.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Views/widgets/Dialog.dart';
import '/Views/widgets/ReadyInput.dart';
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
                        color: Colors.white,
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
                        MyProfil(),
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
          child: Container(
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
                style: TextStyle(
                    fontSize: SWi * 0.045, fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                  "${Provider.of<EventsFavoritProvid>(context).objs.length}"),
              //Text("${Provider.of<EventsFavoritProvid>(context).objs.length}"),
            ),
          ),
        ),
        Card(
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                title: "Ähli bildirişlerim",
                                objs:
                                    Provider.of<UserProvider>(context).allObjs,
                              ))),
                  leading: ImgBtn(
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Icon(Icons.all_inbox, color: Colors.white)),
                  title: Text(
                    "Ähli",
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  trailing: Text(
                      "${Provider.of<UserProvider>(context).allObjs.length}"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                title: "Ullanylan Bildirişlerim",
                                objs: Provider.of<UserProvider>(context)
                                    .oldObjs,
                              ))),
                  leading: ImgBtn(
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Icon(Icons.label, color: Colors.white)),
                  title: Text(
                    "Ulanylan",
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  trailing: Text("${Provider.of<UserProvider>(context).oldObjs.length}"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                title: "Täze Bildirişlerim",
                                objs: Provider.of<UserProvider>(context)
                                    .newObjs,
                              ))),
                  leading: ImgBtn(
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Icon(Icons.fiber_new, color: Colors.white)),
                  title: Text(
                    "Täze",
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  trailing: Text("${Provider.of<UserProvider>(context).newObjs.length}"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                                title: "Tassyklanmagyna Garaşylýan",
                                objs: Provider.of<UserProvider>(context)
                                    .prossesObjs,
                              ))),
                  leading: ImgBtn(
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Icon(Icons.timer, color: Colors.white)),
                  title: Text(
                    "Garaşylýan",
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  trailing: Text(
                      "${Provider.of<UserProvider>(context).prossesObjs.length}"),
                ),
              ),
            ],
          ),
        ),
        Card(
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
                  leading: ImgBtn(
                      onTap: () => PopUppWidget(
                              title: "Ad",
                              content: MyInput(
                                shape: true,
                                index: 3,
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
                                                  UserProperties.getProperty(
                                                      "id")),
                                              name: controls[3].text,
                                              phone: UserProperties.getProperty(
                                                  "phone"),
                                              isban: int.parse(
                                                  UserProperties.getProperty(
                                                      "isban")),
                                              token: UserProperties.getProperty(
                                                  "token"))
                                          .sava();
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          PageName.pageMain,
                                          (route) => route.isFirst);
                                    },
                                    text: "Üýtget",
                                    isPopEnable: false),
                              ]).popUpCupertino(context),
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Icon(Icons.edit, color: Colors.white)),
                  title: Text(
                    "Ady üýtgetmek",
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  //trailing: Text("0"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  leading: ImgBtn(
                      onTap: () => PopUppWidget(
                              title: "Parol",
                              content: MyInput(
                                shape: true,
                                index: 4,
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
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          PageName.pageMain,
                                          (route) => route.isFirst);
                                    },
                                    text: "Üýtget",
                                    isPopEnable: false),
                              ]).popUpCupertino(context),
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
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  //trailing: Text("0"),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: SWi * 0.02),
                child: ListTile(
                  leading: ImgBtn(
                      onTap: () {
                        UserProperties.erase();
                        Provider.of<UsesVar>(context, listen: false)
                            .navBarSelect(0);
                        Navigator.pushNamedAndRemoveUntil(
                            context, PageName.pageMain, (route) => false);
                      },
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      shape: SWi * 0.02,
                      color: Color(0xff5408BF),
                      child: Icon(Icons.logout, color: Colors.white)),
                  title: Text(
                    "Ulgamdan çykmak",
                    style: TextStyle(fontSize: SWi * 0.045),
                  ),
                  //trailing: Text("0"),
                ),
              ),
            ],
          ),
        ),
        /*Card(
          child: Column(
            children: [
              ListTile(leading: Text("Sargytlar")),
              ListTile(leading: Text("Ähli"), trailing: Text("0")),
              ListTile(leading: Text("Garaşylýan"), trailing: Text("0")),
              ListTile(leading: Text("Tölege garaşylýan"), trailing: Text("0")),
              ListTile(
                  leading: Text("Ugradylmaga garaşylýan"), trailing: Text("0")),
              ListTile(leading: Text("Ugradylan"), trailing: Text("0")),
            ],
          ),
        ),*/
      ],
    );
  }
}
