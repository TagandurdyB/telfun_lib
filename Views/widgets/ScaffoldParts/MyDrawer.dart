import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';

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
          Container(height: SHe*0.02,),
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
                                fontSize: 24,
                                fontFamily: "ProximaSoftBold")),
                        Text(UserLoginDetals.getIsLogin()?
                        UserProperties.getProperty("phone"):"",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      ]),

                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawBarBtn(
                    onTap: (context) {
                      Provider.of<UsesVar>(context,listen: false).navBarSelect(0);
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageName.pageMain, (route) => false);
                    },
                    leading:Icon(Icons.home,color: Color(0xff8016FE),),
                    title: Text("Baş sahypa"),
                    trailing: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.mode_night)),
                  ),
                  DrawBarBtn(
                    onTap: (context) {
                      Provider.of<UsesVar>(context,listen: false).navBarSelect(0);
                      Navigator.pushNamed(
                          context, PageName.pageFavorite);
                    },
                    leading: Icon(Icons.bookmark,color: Color(0xff7262DF)),
                    title: Text("Halanlarym"),
                  ),
                  Visibility(
                      visible: UserLoginDetals.getIsLogin(),
                      child: DrawBarBtn(
                    onTap: (context) {
                      Provider.of<UsesVar>(context,listen: false).navBarSelect(2);
                      Navigator.popUntil(context, ModalRoute.withName(PageName.pageMain));
                    },
                    leading: Icon(Icons.account_box_sharp,color: Color(0xff7262DF)),
                    title: Text("Şahsy sahypa"),
                  )),
                /*  Visibility(
                    visible: UserLoginDetals.getIsLogin(),
                    child: DrawBarBtn(
                      onTap: (context) {
                        Navigator.pushNamed(
                            context, PageName.pageDemo);
                      },
                      leading: Icon(Icons.desktop_mac_outlined),
                      title: Text("Demo page"),
                    ),
                  ),*/
                ],
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
