import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Providers/EventProvider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/ViewModels/ShPBDebug.dart';
import 'package:telfun/ViewModels/Providers/Theme_Provider.dart';
import 'package:telfun/ViewModels/Providers/UserProvider.dart';
import 'package:telfun/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import 'package:telfun/Views/widgets/Search.dart';
import '/Models/Public.dart';
import '/Views/widgets/Model.dart';
import '/Views/widgets/SortBtn.dart';
import '/ViewModels/ApiDebuging.dart';

class ModelPage extends StatelessWidget {
  //const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<EventsProvid>(context);
    final String searchText=Provider.of<UsesVar>(context).getSearch;
    List _list = provider.searchWithMarks(searchText);
    return ScaffoldAll(
      appBarBottom: SearchBtn(tag: RITags.rISearchMark),
      topBarHeight: 0.3,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            //color: Colors.red,
              padding: EdgeInsets.symmetric(
                  horizontal: SWi * 0.06, vertical: SWi * 0.05),
              child: Text("Markalar",
                  style: TextStyle(
                      fontSize: SWi * 0.05, fontWeight: FontWeight.w800))),
          Padding(
            padding: EdgeInsets.only(top: SWi * 0.02),
            child: Center(
              child: Wrap(
                runSpacing: SWi * 0.05,
                spacing: SWi * 0.09,
                children: List.generate(
                    _list.length ?? 0,
                    (index) => Model(
                          image: _list[index].image,
                          name: _list[index].name,
                          mark_id: _list[index].id,
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
