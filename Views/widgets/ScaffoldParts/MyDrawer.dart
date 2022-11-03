import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import 'package:telfun/Views/Pages/MainPage.dart';

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawBarBtn(
                    onTap: (context) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, PageName.pageMain, (route) => false);
                    },
                    leading: Icon(Icons.home),
                    title: Text("Baş sahypa"),
                    trailing: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.mode_night)),
                  ),
                  Visibility(
                      visible: UserLoginDetals.getIsLogin(),
                      child: DrawBarBtn(
                    onTap: (context) {
                      Provider.of<UsesVar>(context,listen: false).navBarSelect(2);
                      Navigator.popUntil(context, ModalRoute.withName(PageName.pageMain));
                    },
                    leading: Icon(Icons.account_box_sharp),
                    title: Text("Şahsy sahypa"),
                  ))
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
