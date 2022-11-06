import 'package:flutter/material.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';

class MarkScrol extends StatefulWidget {
  @override
  State<MarkScrol> createState() => _MarkScrolState();
}

class _MarkScrolState extends State<MarkScrol> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SWi,
      height: SWi * 0.25,
    //  color: Colors.red,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: List.generate(
            Get_Lists().getList(Get_Lists.mark).length??0,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: SWi*0.01,horizontal:SWi*0.02),
              child: ImgBtn(
                boxShadow: [
                  BoxShadow(color: index==0?Colors.purpleAccent:Colors.grey[300],spreadRadius: 0,blurRadius: 2,offset: Offset(0,3))
                ],
                color: index==0?Color(0xff9747FF):Colors.grey,
                shape: SWi*0.03,
                width: SWi*0.21,
                    onTap: () {},
                  child: Padding(
                    padding:  EdgeInsets.all(SWi*0.005),
                    child: ImgBtn(
                      color: Colors.white,
                      shape: SWi*0.027,
                      width: SWi*0.21,
                      onTap: () {},
                      child: Image.network("$IP/storage/${Get_Lists().getList(Get_Lists.mark)[index]["image"]}"),
                    ),
                  )
                  ),

            )),
      ),
    );
  }
}
