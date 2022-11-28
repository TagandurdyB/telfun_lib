import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import '/ViewModels/JsonCacher.dart';
import '/ViewModels/JsonDebuger.dart';
import '/ViewModels/MapConverter.dart';
import '/ViewModels/Names.dart';
import '/Views/widgets/InPlitca.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';
import '/Models/Public.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

void removeElemJsonFavorite(ElemEvents _elem) {
  Map _map = localConverter().favoriteToMap(_elem);
  JsonListCacher(jsonName: JsonTags.favorite).removeSaved(_map);
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    List _favorite =
        Get_Lists(listTag: JsonTags.favorite, isApi: false).getList();
/*    _favorite.forEach((element) {
      print("*+*+*+***+*+*+*+*+*++*favoritePage:${element.name}");
    });*/
    return Json_Get(
      jsonName: JsonTags.favorite,
      Return: ScaffoldAll(
          body: Column(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(SWi * 0.03),
              child: Text(
                "Halanlarym",
                style: TextStyle(
                    fontSize: SWi * 0.06, fontWeight: FontWeight.w600),
              )),
          Expanded(
            child: Container(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _favorite.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                        child: InCategory(
                      index: index,
                      list: _favorite,
                      favoriteFunc: () async {
                        removeElemJsonFavorite(_favorite[index]);
                        await Future.delayed(Duration(milliseconds: 50))
                            .then((value) => setState(() {}));
                      },
                    ));
                  }),
            ),
          ),
        ],
      )),
    );
  }
}
