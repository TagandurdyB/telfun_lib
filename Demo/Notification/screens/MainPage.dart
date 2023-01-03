import 'package:flutter/material.dart';
import 'package:telfun/Demo/Notification/screens/HomePage.dart';

class NotiMainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: HomePage(),
    );
  }
}
