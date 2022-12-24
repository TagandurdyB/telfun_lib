import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/ViewModels/ApiDebuging.dart';
import '/ViewModels/Routes.dart';
import '/Views/Login/verificationInput.dart';
import '/Models/Public.dart';

class VerificationPage extends StatelessWidget {
  FirebaseAuth auth;
  User user;
  String verificationID;

  final String phone;

  final Map body;

  VerificationPage(
      {this.verificationID,
      this.auth,
      this.user,
      this.phone, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: ThemeProvided().ststusBrightness,
        backgroundColor: ThemeProvided().colorCanvas,
        shadowColor: Colors.transparent,
      ),
      body: MyVarification(
          context: context,
          auth: auth,
          user: user,
          phone: phone,
          body: body,
          verificationID: verificationID),
    );
  }
}

class MyVarification extends StatefulWidget {
  final context;
  FirebaseAuth auth;
  User user;
  String verificationID = "";
  final String phone;
  final Map body;

  MyVarification(
      {Key key,
      @required this.context,
      this.user,
      this.auth,
      this.verificationID,
      this.phone, this.body})
      : super(key: key);

  @override
  _MyVarificationState createState() => _MyVarificationState();
}

class _MyVarificationState extends State<MyVarification> {
  @override
  /* FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User user;
  String verificationID = "";*/

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            // color: Colors.blue,
            width: double.infinity,
            child: Container(
              height: 40,
              //  width: 200,
              //  color: Colors.red,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("Tassyklama"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: SWi * 0.15),
            height: SWi * 0.1,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                '''
Bu sahypa siziň ýazan telefon belgiňiziň 
hakykatdanam size degişli bolup 
bolmadygyny barlamak üçin goýulan.
Siziň ýazan telefon belgiňize gelen 
paroly ýazyň.
                ''',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(height: SHe * 0.05),
          EnterOTP(),
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("00:00"),
              TextButton(onPressed: () {}, child: Text("Resend ?"))
            ],
          ),*/
          SizedBox(height: SHe * 0.02),
          Card(
            color: Color(0xff5807B6),
            child: ListTile(
              onTap: () {
                String _code = "";
                if (GetOTP().getCode().length < 6 ||
                    GetOTP().getCode() == null) {
                } else {
                  _code = GetOTP().getCode();
                }
                verifyOTP(_code);
                /* Navigator.popUntil(
                    context, ModalRoute.withName(LoginPage.routName));*/
                /* showDialog(context: context, builder: (context)=>
                CupertinoAlertDialog(title: Text("salanm"),
                content: Text("salsa"),));*/
              },
              title: Center(
                  child: Text(
                "Paroly Barla",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }

  void verifyOTP(String codeOTP) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID, smsCode: codeOTP);

    await widget.auth.signInWithCredential(credential).then(
      (value) {
        setState(() {
          widget.user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
      () {
        if (widget.user != null) {
          print("***You are logged in successfully***");
          API_Post(
                  URL: "$IP/api/register",
                  body:widget.body,
                  /*name: widget.name,
                  phone: "+993"+widget.phone,
                  pass: widget.pass*/)
              .addRegister();
          Provider.of<UsesVar>(context,listen: false).navBarSelect(0);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Color(0xff5807B6),
                ),
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Hasap döredildi",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                )),
            backgroundColor: Colors.white,
          ));
          Future.delayed(Duration(seconds: 4)).then((value) =>
              Navigator.popUntil(
                  context, ModalRoute.withName(PageName.pageMain)));
        } else {
          print("***ERROR***");
          /*    Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );*/
        }
      },
    );
  }
}
