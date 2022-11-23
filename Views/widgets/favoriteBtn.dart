import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telfun/Models/Public.dart';
import 'package:telfun/ViewModels/ApiConverter.dart';
import 'package:telfun/ViewModels/JsonCacher.dart';
import 'package:telfun/ViewModels/Names.dart';

import 'imgBtn.dart';

class FavoriteBtn extends StatefulWidget {
final bool favorite;
FavoriteBtn({this.favorite});
  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  @override
  Widget build(BuildContext context) {
    return ImgBtn(
      onTap: (){
        setState(() {
          JsonListCacher(jsonName: JsonName.favorite).save(
            Converter()
          );
        });
      },
      shape: SWi*0.1,
      width: SWi*0.1,
      height: SWi*0.1,
      color: Colors.white,
      boxShadow: [BoxShadow(color:
     widget.favorite?Color(0xff8016FE):
      Colors.grey,offset: Offset(0,3),blurRadius: 5)],
      child: Icon(
        widget.favorite?Icons.bookmark:Icons.bookmark_border,
        color: Color(0xff6C02FF),
      ),

    );
  }
}
