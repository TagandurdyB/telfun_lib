import 'package:flutter/material.dart';
class SortPage extends StatelessWidget {
 // const SortPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          AppBar(
            title: Text("Grades"),

          ),
          Positioned(
            top: -20,
            left: MediaQuery.of(context).size.width / 2 - 150,
            child: Container(
              color: Colors.blue,
              width: 300,
              height: 60,
            ),
          ),
        ],
      ),
    );
  }
}
