import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/Auth.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Views/widgets/Dialog.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

class RemowePassPage extends StatelessWidget {
  String _empetySMS = "Doly we dogry ýazyň!";

  changeFunc(BuildContext context) {
    String phone="+993"+RIBase.getText(RITags.rIPhone);
    if(phone=="+993"){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: ImgBtn(
          height: 50,
          shape: 10,
          color: Colors.grey,
          child: Text(
            "${_empetySMS}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: ThemeProvided().colorCanvas,
      ));
    }else{
      PopUppWidget(
        title: "Garaşyň!",
        content: Container(child: CircularProgressIndicator(),),
      ).popUpCupertino(context);
      Auth(
        context,
        body: {
          "phone": phone,
        },
        phone: phone,
      ).loginWithPhone();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: ThemeProvided().ststusBrightness,
        backgroundColor: ThemeProvided().colorCanvas,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
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
                    child: Text("Paroly dikeltmek"),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                child: ListView(
                  children: [
                    ReadyInput(
                      shape: true,
                      borderRad: 4,
                      tag: RITags.rIPhone,
                      type: Type.tel,
                      label: "Telefon Belgiňiz:",
                      onChange: (val, index) {},
                    ),
                    Card(
                      color: Color(0xff5807B6),
                      child: Builder(
                        builder: (context) => ListTile(
                          onTap:()=>changeFunc(context),
                          title: Center(
                              child: Text(
                                "Dikelt",
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
