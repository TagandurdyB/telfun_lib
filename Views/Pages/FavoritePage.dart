import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/InPlitca.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import 'package:telfun/Models/Public.dart';

class FavoritePage extends StatelessWidget {
  // const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = Get_Lists(apiName: ApiTags.events).getList();
    return ScaffoldAll(
        body: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(SWi*0.03),
                child: Text("Halanlarym",style: TextStyle(
                  fontSize: SWi*0.06,
                  fontWeight: FontWeight.w600
                ),)),
            Expanded(
              child: Container(
      child: ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: list.length??0,
                itemBuilder: (context, index) {
                  return Container(child: InCategory(
                    index: index,
                    list:list,
                  ));
                }),
    ),
            ),
          ],
        ));
  }
}
