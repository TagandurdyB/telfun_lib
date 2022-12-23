import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/Auth.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/ViewModels/ApiDebuging.dart';

import 'Verification.dart';

bool select = false;

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvided().colorCanvas,
      appBar: AppBar(
        // leading: BackButton(color: Colors.black),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Içeri gir",
                style: TextStyle(color: Color(0xff5807B6)),
              )),
        ],
        brightness: ThemeProvided().ststusBrightness,
        backgroundColor: ThemeProvided().colorCanvas,
        shadowColor: Colors.transparent,
      ),
      body: Container(
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
  String _empetySMS = "Doly we dogry ýazyň!",
      _textdetail = "Parolyňyz 6 belgiden az blmaly däl!";
  bool _showdetail = false;

  CreateFunc() async {
    var _contr = controls.where((element) => element.text == "");
    if (_contr.isNotEmpty ||
        controls[2].text != controls[3].text ||
        controls[2].text.length < 6 ||
        select == false) {
      if (select == true)
        _empetySMS = "Doly we dogry ýazyň!";
      else
        _empetySMS = "Hasap döretmek üçin ylalaşyň!";
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
      if (controls[2].text.length < 6) {
        _showdetail = true;
        setState(() {});
      }
      print("empety");
    } else {
      _showdetail = false;
      setState(() {});
      bool isAlredyRegister = await API_Post(URL: "$IP/api/control",
          //URL: "$IP/api/register",
          body: {
            "name": controls[0].text,
            "phone": controls[1].text,
            "pass": controls[2].text,
          }
          /* name: controls[0].text,
        phone: controls[1].text,
        pass: controls[2].text,*/
          ).IsRegister();
      print("**isAlredyRegister = $isAlredyRegister");
      if (!isAlredyRegister) {
        Auth(
          context,
          body: {
            "name": controls[0].text,
            "phone": controls[1].text,
            "password": controls[2].text,
          },
          phone: controls[1].text,
          /*name: controls[0].text,
                pass: controls[2].text*/
        ).loginWithPhone();
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
        Visibility(
          visible: _showdetail,
          child: Container(
            child: Text(
              _textdetail,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange[800], fontSize: 20),
            ),
          ),
        ),
        MyInput(
          index: 2,
          hidden: "Parolyňyz",
          type: Type.pass,
        ),
        MyInput(
          index: 3,
          hidden: "Parolyňyz (dogrylama)",
          type: Type.pass,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: ThemeProvided().colorText,
                  ),
                  child: Checkbox(
                    value: select,
                    onChanged: (chenge) {
                      setState(() {
                        select = chenge;
                      });
                    },
                    shape: CircleBorder(),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PageName.pageContract);
                  },
                  child: Text("Ylalaşýan")),
            ],
          ),
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
                  child: Text(
                    "Içeri gir",
                    style: TextStyle(color: Color(0xff5807B6)),
                  )),
            ],
          ),
        )
      ],
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
        style: ThemeProvided().styleInputText,
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
                child: Icon(
                  Icons.cancel,
                  color: ThemeProvided().colorText,
                ))),
      ),
    );
  }
}
