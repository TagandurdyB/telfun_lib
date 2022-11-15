
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/Views/Pages/MainPage.dart';
import '/Views/Pages/AddOldPage.dart';
import '/Views/Login/LoginPage.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Models/Public.dart';

class MyBottomNavBar extends StatefulWidget {
  final bool IsAdd, IsUser,IsMain;
  const MyBottomNavBar({Key key, this.IsAdd, this.IsUser, this.IsMain}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  double _iconSize = 30;
  int selectIndex = 0,oldSelect=0;
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SWi * 0.08),
            topRight: Radius.circular(SWi * 0.08)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
        ],
      ),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xffC944F6),
        unselectedItemColor: Colors.grey[700],
        currentIndex: Provider.of<UsesVar>(context).witchNavBarSelect(),//selectIndex,
        iconSize: SWi*0.09,
        onTap: (index){
          setState(() {
            if(UserLoginDetals.getIsLogin()&&index==1){
              Provider.of<UsesVar>(context,listen: false).navBarSelect(1);
              if(!widget.IsMain)
               Navigator.popUntil(context, ModalRoute.withName(PageName.pageMain));
            }
            else if(index==1&&!UserLoginDetals.getIsLogin()){
              Navigator.pushNamed(context, PageName.pageLogIn);
            }
            else if(index==2&&!UserLoginDetals.getIsLogin())
            {}
            else if(widget.IsMain) {
              Provider.of<UsesVar>(context, listen: false).navBarSelect(index);
            }
            else {
              Provider.of<UsesVar>(context, listen: false).navBarSelect(index);
              Navigator.popUntil(context,(rout)=>rout.isFirst);}
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.home,
               // color: Colors.black,
              )),
          BottomNavigationBarItem(
              label: "",
              icon: Icon(
                Icons.add_circle_outline_rounded,
             //   color: Colors.blue[800],
              )),
          BottomNavigationBarItem(
              label: "", icon: Icon(Icons.account_circle_outlined,
        //  color: UserLoginDetals.getIsLogin()?Colors.black:Colors.grey
          )
          ),
        ],
      ),
    );
  }
}
