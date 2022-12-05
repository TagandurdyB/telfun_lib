import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/ViewModels/ApiDebuging.dart';
import '/ViewModels/ShPBDebug.dart';
import '/Models/Public.dart';

class LogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Logo();
  }
}

class Logo extends StatefulWidget {
  @override
  _LogoState createState() => _LogoState();
}

int _counter = 0;

class _LogoState extends State<Logo> {
  @override
  IsBlock() async {
    var me = await Get_Me(
            URL: "$IP/api/me", token: UserProperties.getProperty("token"))
        .check();
    print("I am me: $me");
    if (me != 0) {
      UserProperties.erase();
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    if (UserLoginDetals.getIsLogin()) {
      print("token: ${UserProperties.getProperty("token")}");
      IsBlock();
    } else
      print("Not Login!");
    StartTimer();
/*    Post_Api(
      URL: "$IP/api/login",
      //URL: "$IP/api/register",
     // name: UserProperties.getProperty("name"),
     // phone: UserProperties.getProperty("phone"),
     // pass: UserProperties.getProperty("pass"),
      phone: UserProperties.getProperty("phone"),
      pass: UserProperties.getProperty("pass"),
      //  name: "salam"
    ).IsLogin();*/
    // print("is login ? $islogin");
    ////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////
  }

   Timer timer;
int _second=5;
  void StartTimer(){
    timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_second>0)
        _second--;
        if(_second==0){
          timer.cancel();
          Navigator.of(context).pushReplacementNamed(PageName.pageMain);
        }
      });
    });
/*    if(Provider.of<UsesVar>(context).count!=4)
      Future.delayed(Duration(seconds: 5)).then((value) =>
          Navigator.of(context).pushReplacementNamed(PageName.pageMain));*/
  }



  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<UsesVar>(context,listen: false);
    SWi = MediaQuery.of(context).size.width;
    SHe = MediaQuery.of(context).size.height;
    print(SWi);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                left: 1,
                top: 1,
                child: ImgBtn(
                    color: Colors.transparent,
                    onTap: () {
                      setState(() {
                        if (_counter == 0){
                          provider.changeCount(1);
                          _counter = 1;}
                        else {
                          _counter = 0;
                          provider.changeCount(0);
                        }
                      });
                      print("1");
                    })),
            Positioned(
                right: 1,
                top: 1,
                child: ImgBtn(
                    color: Colors.transparent,
                    onTap: () {
                  setState(() {
                    if (_counter == 1) {
                      _counter = 2;
                      provider.changeCount(2);
                    }
                    else {
                      _counter = 0;
                      provider.changeCount(0);
                    }
                  });
                  print("2");
                })),
            Positioned(left: 1, bottom: 1, child: ImgBtn(
                color: Colors.transparent,
                onTap: () {
              setState(() {
                if (_counter == 2) {
                  _counter = 3;
                  provider.changeCount(3);
                }
                else{
                  _counter = 0;
                  provider.changeCount(0);
                }
              });
              print("3");
            })),
            Positioned(right: 1, bottom: 1, child: ImgBtn(
                color: Colors.transparent,
                onTap: () {
              setState(() {
                if (_counter == 3){
                  _counter = 4;
                  provider.changeCount(4);
                }
                else{
                  _counter = 0;
                  provider.changeCount(0);
                }
              });
              timer.cancel();
              print("4");
            })),
            Visibility(
              visible: _counter==4,
              child: Positioned(
                  top: 1,
                  child: ImgBtn(
                    color: Colors.white,
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed(PageName.pageMain);
                    },
                    width: SWi,
                    child: Text(
                      "Tagandurdy Bayremdurdyyew Mekanowic",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: SWi*0.04),
                    ),
                  )),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: SWi * 0.9,
                      height: SWi * 0.9,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: ExactAssetImage("assets/logo.png")),
                      )),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
