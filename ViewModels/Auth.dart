import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Views/Login/Verification.dart';

class Auth{
  final String phone,pass,name;
  final Map body;
  final BuildContext context;
  Auth(this.context,{this.body,this.pass="123456", this.name="telfun", this.phone="xxxxxxxx"});

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User user;
  String verificationID = "";

  void loginWithPhone() async {
    print("+993" + phone);
    auth.verifyPhoneNumber(
      phoneNumber: "+993" + phone,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(10),
                color: Colors.red[700],
              ),
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Bir mesele ýüze çykdy. Az wagtdan soň täzeden synanşyň!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              )),
          backgroundColor: Colors.white,
        ));
        print(e.message);
      },
      codeSent: (String verificationId, int resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerificationPage(
                  auth: auth,
                  user: user,
                  body: body,
                  name: name,
                  phone: "+993"+phone,
                  pass: pass,
                  verificationID: verificationID,
                )));
        // setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}