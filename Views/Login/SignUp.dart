import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/ViewModels/ApiDebuging.dart';

import 'Verification.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Içeri gir",style: TextStyle(color: Color(0xff5807B6)),)),
        ],
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.all(17),
        child: SignUpForm(context: context),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String _empetySMS = "Doly we dogry ýazyň!";
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User user;
  String verificationID = "";

   CreateFunc() async{
    var _contr = controls.where((element) => element.text == "");
    if (_contr.isNotEmpty ||
        controls[2].text != controls[3].text ||
        controls[1].text.length < 8) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.circular(10),
              color: Colors.grey,
            ),
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "${_empetySMS}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,
            )),
        backgroundColor: Colors.white,
      ));
      print("empety");
    }
    else {
      bool isAlredyRegister = await API_Post(
        URL: "$IP/api/control",
        //URL: "$IP/api/register",
        name: controls[0].text,
        phone: controls[1].text,
        pass: controls[2].text,
      ).IsRegister();
      print("**isAlredyRegister = $isAlredyRegister");
      if (isAlredyRegister) {
          loginWithPhone();
      } else {
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
                "Bu belgide hasap döredilen!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              )),
          backgroundColor: Colors.white,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          //color: Colors.blue,
          width: double.infinity,
          child: Container(
            height: 40,
            // width: 100,
            // color: Colors.red,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text("Hasap döret"),
            ),
          ),
        ),
        MyInput(index: 0, hidden: "Adyňyz"),
        /*MyInput(index:  1,hidden: "Email",type:Type.email),*/
        MyInput(
          index: 1,
          hidden: "Telefon belgiňiz",
          type: Type.tel,
        ),
        MyInput(
          index: 2,
          hidden: "Paraolyňyz",
          type: Type.pass,
        ),
        MyInput(
          index: 3,
          hidden: "Paraolyňyz(dogrylama)",
          type: Type.pass,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Color(0xff5807B6),
            child: Builder(
              builder: (context) => ListTile(
                onTap: CreateFunc,
                title: Center(
                    child: Text(
                  "Döret",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Hasabyňyz barmy?"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Içeri gir",style: TextStyle(color: Color(0xff5807B6)),)),
            ],
          ),
        )
      ],
    );
  }

  void loginWithPhone() async {
    print("+993" + controls[1].text);
    auth.verifyPhoneNumber(
      phoneNumber: "+993" + controls[1].text,
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
                      name: controls[0].text,
                      phone: controls[1].text,
                      pass: controls[2].text,
                      verificationID: verificationID,
                    )));
        // setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

List<TextEditingController> controls = [];
enum Type { tel, pass, text, num, email }

class MyInput extends StatefulWidget {
  final int index;
  final String hidden;
  final Type type;
  MyInput({this.index = 0, this.hidden = "", this.type = Type.text});
  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  void initState() {
    if (controls.length < widget.index + 1) {
      controls.add(TextEditingController());
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLength: widget.type == Type.tel ? 8 : null,
        obscureText: widget.type == Type.pass ? true : false,
        keyboardType: widget.type == Type.text
            ? null
            : widget.type == Type.tel
                ? TextInputType.phone
                : widget.type == Type.pass
                    ? TextInputType.visiblePassword
                    : widget.type == Type.email
                        ? TextInputType.emailAddress
                        : TextInputType.numberWithOptions(),
        controller: controls[widget.index],
        decoration: InputDecoration(
            prefix: widget.type == Type.tel ? Text("+993") : null,
            /*  border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),*/
            labelText: widget.hidden,
            suffix: GestureDetector(
                onTap: () {
                  controls[widget.index].clear();
                },
                child: Icon(Icons.cancel))),
      ),
    );
  }
}
