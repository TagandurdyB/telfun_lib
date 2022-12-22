import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import 'package:telfun/Views/widgets/ReadyInput/RIBase.dart';
import 'package:telfun/Views/widgets/ReadyInput/ReadyInput.dart';
import 'package:telfun/Models/Public.dart';

class RemowePassPage extends StatelessWidget {
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
                          onTap: () {},
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
