import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class SearchPage extends StatelessWidget {
  // const SetingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        body: Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SWi * 0.06, vertical: SWi * 0.03),
              child: Text("Filtirler",
                  style: TextStyle(
                      fontSize: SWi * 0.06, fontWeight: FontWeight.w800))),
        ],
      ),
    ));
  }
}
