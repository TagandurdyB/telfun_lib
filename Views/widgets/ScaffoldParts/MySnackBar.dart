import 'package:flutter/material.dart';

class MySnack {
  final String message;
  final int sec;
  final Color bgColor, textColor, textBgColor;

  MySnack(
      {this.sec = 3,
      this.textBgColor = Colors.grey,
      this.textColor = Colors.black,
      this.bgColor = Colors.white,
      this.message = "Message"});

  pushSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: sec),
      content: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadiusDirectional.circular(10),
            color: textBgColor,
          ),
          height: 50,
          alignment: Alignment.center,
          child: Text(
            "${message}",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: textColor),
            textAlign: TextAlign.center,
          )),
      backgroundColor: bgColor,
    ));
  }
}
