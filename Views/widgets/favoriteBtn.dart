import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'imgBtn.dart';

class FavoriteBtn extends StatefulWidget {
  bool favorite;
  final Function onTop;
  final int index;
  FavoriteBtn({this.onTop,this.favorite, this.index});
  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}



class _FavoriteBtnState extends State<FavoriteBtn> {

  void funcFavorite(){
    Map _map = localConverter().elemEventsToMap(
        Get_Lists(listTag: ApiTags.events).getList()[widget.index]);
    _map.addAll({"index":widget.index});
    if (widget.favorite) {
      JsonListCacher(jsonName: JsonTags.favorite).removeSaved(_map);
    } else {
      JsonListCacher(jsonName: JsonTags.favorite).addSaved(_map);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ImgBtn(
      onTap: () async{
      await funcFavorite();
        setState(() {
         /* Get_Lists(isApi: false, listTag: JsonTags.favorite).getList().forEach((element) {
            print(
                "FaworiteListElem:+++:${element.name}");
          });*/
          widget.favorite = !widget.favorite;
        });
        if(widget.onTop!=null)
        widget.onTop();
      },
      shape: SWi * 0.1,
      width: SWi * 0.1,
      height: SWi * 0.1,
      color: Colors.white,
      child: Icon(
        widget.favorite ? Icons.bookmark : Icons.bookmark_border,
        color: Color(0xff6C02FF),
      ),
    );
  }
}
