import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import '/ViewModels/MapConverter.dart';
import '/ViewModels/ApiDebuging.dart';
import '/ViewModels/Names.dart';
import '/Views/Pages/DetalPage.dart';
import '/Models/Public.dart';
import 'favoriteBtn.dart';
import 'imgBtn.dart';

class InCategory extends StatelessWidget {
  final Function favoriteFunc;
  List list;
  final ElemEvents obj;
  final int index;

  InCategory({
    this.obj,
    this.favoriteFunc,
    this.list,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SWi * 0.02, vertical: SWi * 0.017),
      child: ImgBtn(
        color: Color(0xff6A00FF),
        onTap: () {
          print("In Category ID: ${obj.id}");
          print("In Category is_new: ${obj.is_new}");
          print("In Category favorite: ${obj.favorite}");
          Navigator.push(
            context,
            obj.is_new
                ? MaterialPageRoute(
                    builder: (context) => API_Get(
                        URL: "$IP/api/new/${obj.id}",
                        ApiName: ApiTags.detal,
                        Return: DetalPage(
                          obj: obj,
                            isfavorite: obj.favorite /*list[index].favorite*/,
                            index: index)))
                : MaterialPageRoute(
                    builder: (context) => API_Get(
                        URL: "$IP/api/event/${obj.id}",
                        ApiName: ApiTags.detal,
                        Return: DetalPage(
                          obj: obj,
                          isfavorite: obj.favorite /*list[index].favorite*/,
                          index: index,
                        ))),
          );
        },
        boxShadow: [
          BoxShadow(spreadRadius: 0, blurRadius: 5, color: Colors.grey)
        ],
        width: null,
        height: null,
        shape: SWi * 0.04,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(SWi * 0.035),
            color: Colors.white,
          ),
          margin: EdgeInsets.all(SWi * 0.005),
          width: SWi,
          height: SWi * 0.3,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              Positioned(
                  right: 0,
                  top: 0,
                  child: FavoriteBtn(
                    onTop: favoriteFunc,
                    favorite: obj.favorite,
                    obj: obj,
                    index: index,
                    radius: SWi * 0.1,
                  )),
              Positioned(
                right: SWi * 0.1,
                child: Container(
                  padding: EdgeInsets.all(SWi * 0.01),
                  decoration: BoxDecoration(
                      //  color: Colors.grey[400],
                      ),
                  width: SWi * 0.3,
                  height: SWi * 0.3,
                  child: CachedNetworkImage(
                    cacheManager: CacheManager(Config("events",
                        stalePeriod: Duration(days: 15),
                        maxNrOfCacheObjects: 200)),
                    key: UniqueKey(),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Center(
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Icon(
                              Icons.photo,
                              color: Colors.grey,
                            ))),
                    imageUrl: "$IP/storage/${obj.public_image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: SWi * 0.09,
                child: Container(
                  // color: Colors.red,
                  // padding: EdgeInsets.all(SWi * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text("${obj.name}",
                              style: TextStyle(
                                  fontSize: SWi * 0.043,
                                  fontFamily: "NunitoRegular",
                                  fontWeight: FontWeight.w900))),
                      SizedBox(height: SWi * 0.01),
                      /*    Container(
                        child: Text("${list[index]["place"]}",
                            style: TextStyle(
                                fontSize: SWi * 0.04,
                                fontFamily: "Itim")),
                      ),*/
                      Container(
                        child: Text("${obj.price} TMT",
                            style: TextStyle(
                                fontSize: SWi * 0.04,
                                fontFamily: "NunitoRegular")),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: SWi * 0.09,
                bottom: SWi * 0.001,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${obj.place}",
                          style: TextStyle(
                              fontSize: SWi * 0.037,
                              fontFamily: "NunitoRegular",
                              fontWeight: FontWeight.w500)),
                      Text(
                          "${obj.data.day}.${obj.data.month}.${obj.data.year}",
                          style: TextStyle(
                              fontSize: SWi * 0.03,
                              fontFamily: "NunitoRegular",
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
