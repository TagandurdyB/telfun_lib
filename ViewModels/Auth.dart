/*
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Auth{
  final String phoneNum;
  Auth(this.phoneNum);

  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User user;
  String verificationID = "";

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+993" + phoneNum,
      verificationCompleted: ( credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int resendToken) {
        otpVisibility = true;
*/
/*        verificationID = verificationId;
 setState(() {});*//*


      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) {
 setState(() {
          user = FirebaseAuth.instance.currentUser;
        });

      },
    ).whenComplete(
          () {
        if (user != null) {
          print("***You are logged in successfully***");
 Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        } else {
          print("***ERROR***");
    Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );

        }
      },
    );
  }

}


*/
