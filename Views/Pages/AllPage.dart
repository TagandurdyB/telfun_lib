import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Views/Login/SignUp.dart';
import '/Views/widgets/MarkScrol.dart';
import '/Views/widgets/imgBtn.dart';
import '/Views/widgets/InPlitca.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/SortBtn.dart';

class AllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = Get_Lists()
        .getList(Get_Lists.events)
        .where((element) => element["category_id"] == categoriId)
        .toList();
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: SWi*0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImgBtn(
                  width: SWi*0.8,
                  height: SWi*0.12,
                  shape: SWi*0.02,
                  boxShadow: [
                    BoxShadow(blurRadius: 3,spreadRadius: 2,color: Colors.grey[200],offset: Offset(0,5))
                  ],
                  color: Colors.white,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:  SWi*0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Text("Gözle... ",style: TextStyle(fontSize: SWi*0.045,color: Colors.grey),),
                        Icon(Icons.search,size: SWi*0.1,color: Colors.grey,)
                ],),
                  ),),
              ),
              GestureDetector(onTap: (){}, child: Icon(Icons.wrap_text,size: SWi*0.08,))
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(left: SWi * 0.06),
            child: Text("Markalar",
                style: TextStyle(
                    fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
      //  SortBtn(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: SWi * 0.03),
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: (){},
              child: Text("Hemmesini gürmek",
                  style: TextStyle(
                    color: Color(0xff9747FF),
                      fontSize: SWi * 0.035)),
            )),
        MarkScrol(),
        //
        Container(
            padding: EdgeInsets.symmetric(horizontal: SWi * 0.06,vertical: SWi*0.06),
            child: Text("Bildirişler",
                style: TextStyle(
                    fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
        Container(
          alignment: Alignment.center,
          child: Column(
              // spacing: SWi * 0.02,
              //runSpacing: SWi * 0.04,
              children: List.generate(
                  list.length,
                  (index) => InCategory(
                        list: list,
                        index: index,
                      ))),
        ),
      ],
    );
  }
}
