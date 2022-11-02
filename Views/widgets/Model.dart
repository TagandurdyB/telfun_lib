import 'package:flutter/material.dart';

import '/Models/Public.dart';
import 'imgBtn.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';

class Model extends StatefulWidget {
  final String image;

   Model({@required this.image}) ;
 // const Model({Key? key}) : super(key: key);

  @override
  _ModelState createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    return  ImgBtn(
      boxShadow: [BoxShadow(spreadRadius: 0,blurRadius: 3,offset: Offset(1,3),color: Colors.grey),
        BoxShadow(spreadRadius: 0,blurRadius: 3,offset: Offset(-1,3),color: Colors.grey)],
      shape: SWi*0.03,
      width: SWi * 0.35,
      height: SWi * 0.4,
color: Color(0xffF6F2FA),
//colors: [Colors.deepPurple,Colors.blue],
      child: Image.network("$IP/storage/${widget.image}"),
    );
  }
}
