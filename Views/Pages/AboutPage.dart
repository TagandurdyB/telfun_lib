import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        body: ImgBtn(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            //  alignment: Alignment.topCenter,
            child: Text(
              "About",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: SWi * 0.04),
            )));
  }
}
