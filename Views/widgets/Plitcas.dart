import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiConverter.dart';
import '/ViewModels/Names.dart';
import '/ViewModels/ApiDebuging.dart';
import 'Plitca.dart';

class Categories extends StatelessWidget {
  //const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:List.generate(Get_Lists(apiName: ApiTags.categori).getList().length??0, (index) =>
Categori(list:Get_Lists(apiName: ApiTags.categori).getList(),index: index)
      ),
    );
  }
}

