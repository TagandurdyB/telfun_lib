import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'imgBtn.dart';

class FavoriteBtn extends StatefulWidget {
  bool favorite, enableShadow;
  final Color boxShadowActivColor, boxShadowPacivColor;
  final Function onTop;
  final int index;
  final double radius;
  final ElemEvents obj;
  FavoriteBtn(
      {this.obj,
      this.enableShadow = false,
      this.radius = 20,
      this.onTop,
      this.favorite = false,
      this.index,
      this.boxShadowActivColor,
      this.boxShadowPacivColor});
  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  void funcFavorite() {
    Map _map = localConverter().elemEventsToMap(widget.obj);
    // _map.addAll({"index":widget.index});
    if (widget.favorite) {
      JsonListCacher(jsonName: JsonTags.favorite).removeSaved(_map);
    } else {
      JsonListCacher(jsonName: JsonTags.favorite).addSaved(_map);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("+++++++favoriteBTN:${widget.favorite}");
    return ImgBtn(
      boxShadow: widget.enableShadow
          ? [
              BoxShadow(
                  offset: Offset(0, widget.favorite ? 3 : 2.5),
                  color: widget.favorite
                      ? widget.boxShadowActivColor
                      : widget
                          .boxShadowPacivColor, // Color(0xff6900FE) : Color(0xffD7BFFC),
                  blurRadius: widget.favorite ? 20 : 2.5)
            ]
          : null,
      onTap: () async {
        await funcFavorite();
        setState(() {
          widget.favorite = !widget.favorite;
        });
        if (widget.onTop != null) widget.onTop();
      },
      shape: widget.radius,
      width: widget.radius,
      height: widget.radius,
      color: Colors.white,
      child: Icon(
        widget.favorite ? Icons.bookmark : Icons.bookmark_border,
        size: widget.radius * 0.7,
        color: Color(0xff6C02FF),
      ),
    );
  }
}
