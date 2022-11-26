import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/MapConverter.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/Pages/AllPage.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/Pages/CategoriPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '/Models/Public.dart';

class Categori extends StatelessWidget {
  final List list;
  final int index;
  String str = "Telfonlar";
  Categori({Key key, this.list, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Provider.of<UsesVar>(context, listen: false).changeMark(0, -1);
        // Provider.of<UsesVar>(context, listen: false).Select(0);
        int categoriId =
            Get_Lists(listTag: ApiTags.categori).getList()[index].id;
        Provider.of<UsesVar>(context,listen: false).changeCategoryIndex(index);
        print("CategoryID:$categoriId");
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => API_Get(
                URL: "$IP/api/category/$categoriId",
                ApiName: ApiTags.events,
                Return: AllPage(
                  category_id: categoriId,
                ))));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(SWi * 0.05),
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10)
            ],
            color: Color(0xff7262DF),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // colors: [Color(0xff8777FA), Color(0xffB493F0)])),
                colors: [
                  Color(0xff5102BA),
                  Color(0xff6C13AF),
                  Color(0xff7619AC)
                ])),
        margin: EdgeInsets.fromLTRB(8, 7, 8, 7),
        height: SWi * 0.35,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(SWi * 0.05),
          child: Row(
            children: [
              SizedBox(width: SWi * 0.05),
              Expanded(
                child: Stack(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      // color: Colors.red,
                      child: Text("${list[index].tm}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "ProximaSoftBold",
                              fontSize: 30)),
                    ),
                    Container(
                      // color: Colors.blue,
                      padding: EdgeInsets.all(SWi * 0.02),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Bildirişler : (${list[index].count})",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "ProximaSoftBold",
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: SWi * 0.05),
              Container(
                width: SWi * 0.35,
                height: SWi * 0.35,
                /*    decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: */ /*NetworkImage(
                            "$IP/storage/${list[index]["image"]}")*/ /*
                    )),*/
                child: CachedNetworkImage(
                  cacheManager: CacheManager(Config("categori",
                      stalePeriod: Duration(days: 15),
                      maxNrOfCacheObjects: 200)),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Icon(
                            Icons.photo,
                            color: Colors.grey,
                          ))),
                  key: UniqueKey(),
                  imageUrl: "$IP/storage/${list[index].image}",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
