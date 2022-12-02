import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import '/ViewModels/JsonCacher.dart';
import '/ViewModels/JsonDebuger.dart';
import '/ViewModels/MapConverter.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/InPlitca.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import '/Models/Public.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Json_Get(
      jsonName: JsonTags.favorite,
      Return: ScaffoldAll(body: FavoriteView()),
    );
  }
}

class FavoriteView extends StatefulWidget {
  @override
  _FavoriteViewState createState() => _FavoriteViewState();
}

void removeElemJsonFavorite(ElemEvents _elem) {
  Map _map = localConverter().favoriteToMap(_elem);
  JsonListCacher(jsonName: JsonTags.favorite).removeSaved(_map);
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_Lists(listTag: JsonTags.favorite, isApi: false).getList().forEach((element) {
print("name:${element.name} is_new:${element.is_new}");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(SWi * 0.03),
            child: Text(
              "Bellänlerim",
              style: TextStyle(
                  fontSize: SWi * 0.06, fontWeight: FontWeight.w600),
            )),
        Expanded(
          child: Container(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: Get_Lists(listTag: JsonTags.favorite, isApi: false).getList().length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                      child: InCategory(
                       // index: index,
                          obj: Get_Lists(listTag: JsonTags.favorite, isApi: false).getList()[index],
                        //list: Get_Lists(listTag: JsonTags.favorite, isApi: false).getList(),
                        favoriteFunc: () async {
                          removeElemJsonFavorite(Get_Lists(listTag: JsonTags.favorite, isApi: false).getList()[index]);
                          await Future.delayed(Duration(milliseconds: 50))
                              .then((value) => setState(() {}));
                        },
                      ));
                }),
          ),
        ),
      ],
    );
  }
}
