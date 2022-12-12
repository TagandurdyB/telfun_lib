import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Models/Public.dart';
import '../DrawBarBtn.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    @required this.context,
  }) : super(key: key);

  final context;

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(children: [
          Container(
              color: Color(0xff7262DF),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
              )),
          Container(
            height: SHe * 0.02,
          ),
          Visibility(
            visible: UserLoginDetals.getIsLogin(),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
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
                      leading: ImgBtn(
                          shape: SWi * 0.02,
                          borderColor: Color(0xff9245FF),
                          borderWidth: SWi * 0.003,
                          width: SWi * 0.11,
                          height: SWi * 0.11,
                          color: Colors.white,
                          child: Icon(
                            Icons.home,
                            color: Color(0xff6A00FF),
                            size: SWi * 0.08,
                          )),
                      title: Text("Baş sahypa"),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.wb_sunny_outlined)),
                    ),
                    DrawBarBtn(
                      titleLeft: SWi * 0.15,
                      onTap: (context) {
                        Provider.of<UsesVar>(context, listen: false)
                            .navBarSelect(0);
                        Navigator.pushNamed(context, PageName.pageFavorite);
                      },
                      leading: ImgBtn(
                          shape: SWi * 0.02,
                          borderColor: Color(0xff9245FF),
                          borderWidth: SWi * 0.003,
                          width: SWi * 0.11,
                          height: SWi * 0.11,
                          color: Colors.white,
                          child: Icon(
                            Icons.bookmark,
                            color: Color(0xff6A00FF),
                            size: SWi * 0.08,
                          )),
                      title: Text("Bellänlerim"),
                    ),
                    Visibility(
                        visible: UserLoginDetals.getIsLogin(),
                        child: DrawBarBtn(
                          titleLeft: SWi * 0.15,
                          onTap: (context) {
                            Provider.of<UsesVar>(context, listen: false)
                                .navBarSelect(2);
                            Navigator.popUntil(context,
                                ModalRoute.withName(PageName.pageMain));
                          },
                          leading: ImgBtn(
                              shape: SWi * 0.02,
                              borderColor: Color(0xff9245FF),
                              borderWidth: SWi * 0.003,
                              width: SWi * 0.11,
                              height: SWi * 0.11,
                              color: Colors.white,
                              child: Icon(
                                Icons.account_box_rounded,
                                color: Color(0xff6A00FF),
                                size: SWi * 0.08,
                              )),
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
                        leading: ImgBtn(
                            shape: SWi * 0.02,
                            borderColor: Color(0xff9245FF),
                            borderWidth: SWi * 0.003,
                            width: SWi * 0.11,
                            height: SWi * 0.11,
                            color: Colors.white,
                            child: Icon(
                              Icons.add_circle_outlined,
                              color: Color(0xff6A00FF),
                              size: SWi * 0.08,
                            )),
                        title: Text("Bildirişleri goş"),
                      ),
                    ),
                    DrawBarBtn(
                      titleLeft: SWi * 0.15,
                      onTap: (context) {
                        Navigator.pushNamed(context, PageName.pageShop);
                      },
                      leading: ImgBtn(
                          shape: SWi * 0.02,
                          borderColor: Color(0xff9245FF),
                          borderWidth: SWi * 0.003,
                          width: SWi * 0.11,
                          height: SWi * 0.11,
                          color: Colors.white,
                          child: Icon(
                            Icons.account_balance,
                            color: Color(0xff6A00FF),
                            size: SWi * 0.08,
                          )),
                      title: Text("Dükanlar"),
                    ),
                    DrawBarBtn(
                      titleLeft: SWi * 0.15,
                      onTap: (context) {
                        launch("tel://+99365000000");
                      },
                      leading: ImgBtn(
                          shape: SWi * 0.02,
                          borderColor: Color(0xff9245FF),
                          borderWidth: SWi * 0.003,
                          width: SWi * 0.11,
                          height: SWi * 0.11,
                          color: Colors.white,
                          child: Icon(
                            Icons.phone,
                            color: Color(0xff6A00FF),
                            size: SWi * 0.08,
                          )),
                      title: Text("Habarlaşmak"),
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
                          color: Colors.white,
                          child: CircleAvatar(
                            radius: SWi * 0.035,
                            backgroundColor: Color(0xff6A00FF),
                            child: Text(
                              "i",
                              style: TextStyle(
                                  color: Colors.white, fontSize: SWi * 0.05),
                            ),
                          )
                          ),
                      title: Text("Barada"),
                    ),
                    /////////////////////////////////////////////
                    Visibility(
                      visible: true,
                      child: DrawBarBtn(
                        titleLeft: SWi * 0.15,
                        onTap: (context) {
                          Navigator.pushNamed(context, PageName.pageDemo);
                        },
                        leading: ImgBtn(
                            shape: SWi * 0.02,
                            borderColor: Color(0xff9245FF),
                            borderWidth: SWi * 0.003,
                            width: SWi * 0.11,
                            height: SWi * 0.11,
                            color: Colors.white,
                            child: Icon(
                              Icons.desktop_mac_outlined,
                              color: Color(0xff6A00FF),
                              size: SWi * 0.08,
                            )
                            ),
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
