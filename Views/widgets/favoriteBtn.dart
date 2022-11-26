import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'imgBtn.dart';

class FavoriteBtn extends StatefulWidget {
  bool favorite;
  final int index;
  FavoriteBtn({this.favorite, this.index});
  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  @override
  Widget build(BuildContext context) {
    return ImgBtn(
      onTap: () {
        setState(() {
          if (widget.favorite) {
            Map _map = localConverter().elemEventsToMap(
                Get_Lists(listTag: ApiTags.events).getList()[widget.index]);
          //  print("_MAp++++:$_map");
              JsonListCacher(jsonName: JsonTags.favorite).removeSaved(_map);

          } else {
            Map _map = localConverter().elemEventsToMap(
                Get_Lists(listTag: ApiTags.events).getList()[widget.index]);
          //  print("_MAp++++:$_map");
              JsonListCacher(jsonName: JsonTags.favorite).addSaved(_map);
          }
          //  JsonListCacher(jsonName: JsonName.favorite)
          widget.favorite = !widget.favorite;
        });
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
