import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import '/ViewModels/Names.dart';
import '/ViewModels/ApiDebuging.dart';
import 'Plitca.dart';

class Categories extends StatelessWidget {
  //const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   //Future.delayed(Duration(milliseconds: 50));
    // print("sdasdas Categories:${Get_Lists(listTag: ApiTags.categori).getList().length}");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:List.generate(Get_Lists(listTag: ApiTags.categori).getList().length??0, (index) =>
Categori(list:Get_Lists(listTag: ApiTags.categori).getList(),index: index)
      ),
    );
  }
}

