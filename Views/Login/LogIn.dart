import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  static String routName = "/LogInPage";
  // const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
      body: Container(
          color: Colors.white,
          child: Container(
              alignment:Alignment.center,child: Text("Log In"))),
    );
  }
}
