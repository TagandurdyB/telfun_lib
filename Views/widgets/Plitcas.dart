import 'package:flutter/material.dart';
import '/ViewModels/ApiDebuging.dart';
import 'Plitca.dart';

class Categories extends StatelessWidget {
  //const Categories({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children:List.generate(Get_Lists().getList(Get_Lists.categori).length??0, (index) =>
Categori(list:Get_Lists().getList(Get_Lists.categori),index: index)
      ),
    );
  }
}

