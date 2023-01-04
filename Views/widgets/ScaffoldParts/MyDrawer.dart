import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Models/Public.dart';
import '../DrawBarBtn.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    @required this.context, this.title,
  }) : super(key: key);

  final context,title;

  @override
  Widget build(BuildContext context) {
    final providerTheme = Provider.of<ThemeProvided>(context);
    return Drawer(
      child: Column(children: [
        Container(
            color: Color(0xff7262DF),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            )),
        Container(
          height: SHe * 0.02,
        ),
        title,
        Visibility(
          visible: UserLoginDetals.getIsLogin(),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: ThemeProvided().colorText,
                  child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                          UserLoginDetals.getIsLogin()
                              ? "${UserProperties.getProperty("name")[0].toUpperCase()}"
                              : "",
                          style: TextStyle(fontSize: 24))),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          UserLoginDetals.getIsLogin()
                              ? "${UserProperties.getProperty("name")}"
                              : "",
                          style: TextStyle(
                              fontSize: 24, fontFamily: "ProximaSoftBold")),
                      Text(
                          UserLoginDetals.getIsLogin()
                              ? UserProperties.getProperty("phone")
                              : "",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ]),
              ],
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  DrawBarBtn(
                    onTap: (context) {
                      Provider.of<UsesVar>(context, listen: false)
                          .navBarSelect(0);
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageName.pageMain, (route) => false);
                    },
                    titleLeft: SWi * 0.15,
                    leading: draverIcon(Icons.home),
                    title: Text("Baş sahypa"),
                    trailing: IconButton(
                        onPressed: () {
                          Provider.of<ThemeProvided>(context, listen: false)
                              .tongleTheme();
                        },
                        icon: providerTheme.iconThemeBtn),
                  ),
                  DrawBarBtn(
                    titleLeft: SWi * 0.15,
                    onTap: (context) {
                      Provider.of<UsesVar>(context, listen: false)
                          .navBarSelect(0);
                      Navigator.pushNamed(context, PageName.pageFavorite);
                    },
                    leading: draverIcon(Icons.bookmark),
                    title: Text("Bellänlerim"),
                  ),
                  Visibility(
                      visible: UserLoginDetals.getIsLogin(),
                      child: DrawBarBtn(
                        titleLeft: SWi * 0.15,
                        onTap: (context) {
                          Provider.of<UsesVar>(context, listen: false)
                              .navBarSelect(2);
                          Navigator.popUntil(
                              context, ModalRoute.withName(PageName.pageMain));
                        },
                        leading: draverIcon(Icons.account_box_rounded),
                        title: Text("Şahsy sahypa"),
                      )),
                  Visibility(
                    visible: UserLoginDetals.getIsLogin(),
                    child: DrawBarBtn(
                      titleLeft: SWi * 0.15,
                      onTap: (context) {
                        Provider.of<UsesVar>(context, listen: false)
                            .navBarSelect(1);
                        Navigator.popUntil(
                            context, ModalRoute.withName(PageName.pageMain));
                      },
                      leading: draverIcon(Icons.add_circle_outlined),
                      title: Text("Bildirişleri goş"),
                    ),
                  ),
                  DrawBarBtn(
                    titleLeft: SWi * 0.15,
                    onTap: (context) {
                      Navigator.pushNamed(context, PageName.pageShop);
                    },
                    leading: draverIcon(Icons.account_balance),
                    title: Text("Dükanlar"),
                  ),
                  Visibility(
                      visible: UserLoginDetals.getIsLogin(),
                      child: DrawBarBtn(
                        titleLeft: SWi * 0.15,
                        onTap: (context) {
                          Navigator.pushNamed(context, PageName.pageAddShop);
                        },
                        leading: draverIcon(Icons.add_business),
                        title: Text("Dükan goş"),
                      )),
                  Visibility(
                    visible: UserLoginDetals.getIsLogin(),
                    child: DrawBarBtn(
                      titleLeft: SWi * 0.15,
                      onTap: (context) {
                        Navigator.pushNamed(context, PageName.pageChat);
                        // launch("tel://+99365000000");
                      },
                      leading: draverIcon(Icons.sms),
                      title: Text("Habarlaşmak"),
                    ),
                  ),
                  DrawBarBtn(
                    titleLeft: SWi * 0.15,
                    onTap: (context) {
                      Navigator.pushNamed(context, PageName.pageAbout);
                    },
                    leading: ImgBtn(
                        shape: SWi * 0.02,
                        borderColor: Color(0xff9245FF),
                        borderWidth: SWi * 0.003,
                        width: SWi * 0.11,
                        height: SWi * 0.11,
                        color: ThemeProvided().colorCanvas,
                        child: CircleAvatar(
                          radius: SWi * 0.035,
                          backgroundColor: Color(0xff6A00FF),
                          child: Text(
                            "i",
                            style: TextStyle(
                                color: Colors.white, fontSize: SWi * 0.05),
                          ),
                        )),
                    title: Text("Barada"),
                  ),
                  /////////////////////////////////////////////
                  Visibility(
                    visible: false,
                    child: DrawBarBtn(
                      titleLeft: SWi * 0.15,
                      onTap: (context) {
                        Navigator.pushNamed(context, PageName.pageDemo);
                      },
                      leading: draverIcon(Icons.desktop_mac_outlined),
                      title: Text("Barada"),
                    ),
                  ),
                  /////////////////////////////////////////////
                ],
              ),
            ),
          ),
        )
      ]),
      /* child: Container(
          color: Colors.white,
          child: Column(
            children: [
              */ /* Container(color: Colors.red,width: 100,height: MediaQuery.of(context).hashCode,),*/ /*
            ],
          ),
        ),*/
    );
  }

  ImgBtn draverIcon(IconData icon) {
    return ImgBtn(
                      shape: SWi * 0.02,
                      borderColor: Color(0xff9245FF),
                      borderWidth: SWi * 0.003,
                      width: SWi * 0.11,
                      height: SWi * 0.11,
                      color: ThemeProvided().colorCanvas,
                      child: Icon(
                        icon,
                        color: Color(0xff6A00FF),
                        size: SWi * 0.08,
                      ));
  }
}
