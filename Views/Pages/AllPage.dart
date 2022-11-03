import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        SortBtn(),
        Container(
          alignment: Alignment.center,
          child: Wrap(
              spacing: SWi * 0.02,
              runSpacing: SWi * 0.04,
              children: List.generate(
                  list.length,
                  (index) => InCategory(list: list,index: index,))),
        ),
      ],
    );
  }
}


