import 'package:flutter/material.dart';

import '../widgets/ScaffoldParts/ScaffoldAll.dart';

class SearchPage extends StatelessWidget {
  // const SetingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        body: Container(
      alignment: Alignment.center,
      child: Text("Filterler"),
    ));
  }
}
