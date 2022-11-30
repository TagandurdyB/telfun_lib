import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'imgBtn.dart';

class FavoriteBtn extends StatefulWidget {
  bool favorite;
  final List<BoxShadow> boxShadow;
  final Function onTop;
  final int index;
  final double radius;
  FavoriteBtn({this.radius=20,this.onTop,this.favorite, this.index, this.boxShadow});
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
      boxShadow: widget.boxShadow,
      onTap: () async{
      await funcFavorite();
        setState(() {
          widget.favorite = !widget.favorite;
        });
        if(widget.onTop!=null)
        widget.onTop();
      },
      shape:  widget.radius,
      width:  widget.radius,
      height:  widget.radius,
      color: Colors.white,
      child: Icon(
        widget.favorite ? Icons.bookmark : Icons.bookmark_border,
        size: widget.radius*0.7,
        color: Color(0xff6C02FF),
      ),
    );
  }
}
