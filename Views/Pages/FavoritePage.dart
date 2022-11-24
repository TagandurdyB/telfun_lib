import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/JsonDebuger.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/InPlitca.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import 'package:telfun/Models/Public.dart';

class FavoritePage extends StatelessWidget {
  // const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Json_Get(
      jsonName: JsonTags.favorite,
      Return: ScaffoldAll(
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
                  itemCount: Get_Lists(listTag: JsonTags.favorite,isApi: false).getList().length??0,
                  itemBuilder: (context, index) {
                    return Container(child: InCategory(
                      index: index,
                      list:Get_Lists(listTag: JsonTags.favorite,isApi: false).getList(),
                    ));
                  }),
      ),
              ),
            ],
          )),
    );
  }
}
