import 'package:flutter/material.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import '/Models/Public.dart';
import '/Views/widgets/Model.dart';
import '/Views/widgets/SortBtn.dart';
import '/ViewModels/ApiDebuging.dart';

class ModelPage extends StatelessWidget {
  //const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SortBtn(),
          Padding(
            padding: EdgeInsets.only(top: SWi * 0.05),
            child: Center(
              child: Wrap(
                runSpacing: SWi * 0.05,
                spacing: SWi * 0.09,
                children: List.generate(
                    Get_Lists().getList(Get_Lists.mark).length ?? 0,
                    (index) => Model(image: Get_Lists().getList(Get_Lists.mark)[index]["image"],)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
