import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Views/Login/SignUp.dart';
import '/Views/widgets/MarkScrol.dart';
import '/Views/widgets/imgBtn.dart';
import '/Views/widgets/InPlitca.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/SortBtn.dart';
import '/Views/widgets/Search.dart';
import 'package:provider/provider.dart';

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
        SearchBtn(),
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
              onPressed: (){
                Provider.of<UsesVar>(context,listen:false).changeMark(-1,-1);
              },
              child: Text("Hemmesini görmek",
                  style: TextStyle(
                    color: Color(0xff9747FF),
                      fontSize: SWi * 0.035)),
            )),
       Visibility(
    visible:Get_Lists().getList(Get_Lists.mark).length>0,
    child: MarkScrol(),
    ),
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
