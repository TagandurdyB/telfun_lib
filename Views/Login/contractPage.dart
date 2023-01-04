import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/Models/Public.dart';

class ContractPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Şertnama",
            style: ThemeProvided().styleUserPage, textAlign: TextAlign.start),
        brightness: ThemeProvided().ststusBrightness,
        backgroundColor: ThemeProvided().colorCanvas,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(SWi * 0.1),
        child: Text("Şertnama!!!", textAlign: TextAlign.start,style: ThemeProvided().styleEnable),
      ),
    );
  }
}
