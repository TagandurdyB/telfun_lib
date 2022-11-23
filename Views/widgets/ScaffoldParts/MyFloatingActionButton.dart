import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:url_launcher/url_launcher.dart';

import '../imgBtn.dart';

void tellCall(String phone) async {
  launch("tel://$phone");
}

class MyFloatingActionButton extends StatelessWidget {
  final Function onTop;
  final String phone;
  MyFloatingActionButton({Key key, this.onTop, this.phone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ImgBtn(
      onTap: () {
        // tellCall(list[0].phone);
        // onTop;
        tellCall(phone);
      },
      shape: SWi * 0.02,
      width: SWi * 0.9,
      height: SWi * 0.1,
      color: Color(0xff6900FE),
      child: Text(
        "JAŇ ETMEK",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
