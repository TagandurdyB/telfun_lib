//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool varol = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //FirebaseMessaging SMS=FirebaseMessaging.instance;
  //  SMS.getToken().then((value) {
   //   print("Firebase token:${value}");
  //  } );

  }

  void showNotification(_val){
    setState(() {
      varol = _val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(24),
      child: Card(
        child: ListTile(
          title: Text("Push notification"),
          trailing: Checkbox(
            value: varol,
            onChanged: (_val) {
            showNotification(_val);
            },
          ),
        ),
      ),
    );
  }
}
