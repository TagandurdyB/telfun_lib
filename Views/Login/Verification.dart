import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/ViewModels/ApiDebuging.dart';
import '/ViewModels/Routes.dart';
import '/Views/Login/verificationInput.dart';
import '/Models/Public.dart';

class VerificationPage extends StatelessWidget {
  FirebaseAuth auth;
  User user;
  String verificationID;

  final String name, pass, phone;

  VerificationPage(
      {this.verificationID,
      this.auth,
      this.user,
      this.name,
      this.pass,
      this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: MyVarification(
          context: context,
          auth: auth,
          user: user,
          name: name,
          phone: phone,
          pass: pass,
          verificationID: verificationID),
    );
  }
}

class MyVarification extends StatefulWidget {
  final context;
  FirebaseAuth auth;
  User user;
  String verificationID = "";
  final String name, pass, phone;

  MyVarification(
      {Key key,
      @required this.context,
      this.user,
      this.auth,
      this.verificationID,
      this.name,
      this.pass,
      this.phone})
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
                child: Text("Dorulama"),
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
          SizedBox(height: SHe * 0.03),
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
            color: Color(0xff81A5FB),
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

  void verifyOTP(String OTP) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID, smsCode: OTP);

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
          /* Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );*/
          API_Post(
                  URL: "$IP/api/register",
                  name: widget.name,
                  phone: "+993"+widget.phone,
                  pass: widget.pass)
              .addRegister();
          Provider.of<UsesVar>(context,listen: false).navBarSelect(0);
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.blue[700],
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
