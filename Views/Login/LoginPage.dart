import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/Routes.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Models/SharedPref.dart';
import '/Models/Public.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SignUp.dart';
import 'Verification.dart';
import '/Views/Pages/MainPage.dart';

void callTel(String num) async {
  await launch("tel://$num");
}

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);
  String _empetySMS = "Doly we dogry ýazyň!";

  void canLogin(context) async {
    {
      var _contr = controls.where((element) => element.text == "");
      if (_contr.isNotEmpty ||
          controls[0].text.length < 8 ||
          controls[1].text.length < 6) {
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
      } else {
        print(controls[0].text);
        print(controls[1].text);
        bool canLogin = await API_Post(
          URL: "$IP/api/login",
          //URL: "$IP/api/register",
          // name: "name124",
          phone: "+993" + controls[0].text,
          pass: controls[1].text,
        ).IsLogin();
        print("***canLogin = $canLogin");
        if (canLogin) {
          Provider.of<UsesVar>(context, listen: false).navBarSelect(1);
          //Provider.of<UsesVar>(context,listen: false).changeLogin(true);
          UserLoginDetals.saveLogin(true);
          Navigator.popUntil(context, ModalRoute.withName(PageName.pageMain));
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.orange,
                ),
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Bu hasap ýok!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                )),
            backgroundColor: Colors.white,
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.all(17),
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  // color: Colors.blue,
                  width: double.infinity,
                  child: Container(
                    height: 40,
                    //  width: 200,
                    //  color: Colors.red,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text("Içeri Gir"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInput(
                    index: 0, hidden: "Telefon Belgiňiz:", type: Type.tel),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyInput(index: 1, hidden: "Parolyňyz:", type: Type.pass),
              ),
              /* Remember(),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.blue,
                  child: Builder(
                    builder: (context) => ListTile(
                      onTap: () {
                        canLogin(context);
                      },
                      title: Center(
                          child: Text(
                        "Içeri Gir ",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
              Container(
                // alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Täze ulanyjymy?"),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, PageName.pageSignUp);
                        },
                        child: Text("Hasap döret")),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

List<TextEditingController> controls = [];
enum Type { tel, pass, text, num, email }

class MyInput extends StatefulWidget {
  final int index;
  final String hidden;
  final Type type;
  final Function onControl;
  MyInput(
      {this.index = 0,
      this.hidden = "",
      this.type = Type.text,
      this.onControl});
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
        onChanged: (value) {
          widget.onControl(value, widget.index);
        },
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
/*

class Remember extends StatefulWidget {
  @override
  State<Remember> createState() => _RememberState();
}

class _RememberState extends State<Remember> {
  bool select = RemenberMeEnable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: select,
                onChanged: (chenge) {
                  setState(() {
                    select = chenge ?? false;
                  });
                },
                shape: CircleBorder(),
              ),
              Text("Remember me"),
            ],
          ),
          TextButton(onPressed: () {
            callTel("+993000000");
          }, child: Text("Forgor pasword?")),
        ],
      ),
    );
  }
}
*/
