import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/EventProvider.dart';
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

class FavoriteView extends StatelessWidget {
  void removeElemJsonFavorite(ElemEvents _elem) {
    Map _map = localConverter().favoriteToMap(_elem);
    JsonListCacher(jsonName: JsonTags.favorite).removeSaved(_map);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsFavoritProvid>(context);
    final List objs = provider.objs;
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(SWi * 0.03),
            child: Text(
              "Bellänlerim",
              style:
                  TextStyle(fontSize: SWi * 0.06, fontWeight: FontWeight.w600),
            )),
        Expanded(
          child: Container(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: objs
                    .length, //Get_Lists(listTag: JsonTags.favorite, isApi: false).getList().length ?? 0,
                itemBuilder: (context, index) {
                  final ElemEvents _obj = objs[index];
                  return Container(
                      child: InCategory(
                    // index: index,
                    obj: _obj,
                    isFavorite: true, //provider.isExist(_obj),
                    //Get_Lists(listTag: JsonTags.favorite, isApi: false).getList()[index],
                    //list: Get_Lists(listTag: JsonTags.favorite, isApi: false).getList(),
                    favoriteFunc: () {
                      removeElemJsonFavorite(_obj);
                    },
                  ));
                }),
          ),
        ),
      ],
    );
  }
}
