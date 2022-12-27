import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/Theme_Provider.dart';
import '/ViewModels/MapConverter.dart';
import '/ViewModels/ApiDebuging.dart';
import '/ViewModels/Names.dart';
import '/Views/Pages/DetalPage.dart';
import '/Models/Public.dart';
import 'favoriteBtn.dart';
import 'imgBtn.dart';

class InCategory extends StatefulWidget {
  final Function favoriteFunc;
  List list;
  final ElemEvents obj;
  final int index;
  final bool isFavorite;

  InCategory({
    this.isFavorite = false,
    this.obj,
    this.favoriteFunc,
    this.list,
    @required this.index,
  });

  @override
  _InCategoryState createState() => _InCategoryState();
}

class _InCategoryState extends State<InCategory> {
  @override
  Widget build(BuildContext context) {
   final String _place= widget.obj.etrap.shortName() != "Ähli"
        ? "${widget.obj.place} / ${widget.obj.etrap.shortName()}"
        : "${widget.obj.place}";
   final String _place2= widget.obj.etrap.shortName() != "Ähli"
       ? "${widget.obj.place} / ${widget.obj.etrap.name}"
       : "${widget.obj.place}";
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SWi * 0.02, vertical: SWi * 0.017),
      child: ImgBtn(
        color: Color(0xff6A00FF),
        onTap: () {
          Provider.of<UsesVar>(context,listen: false).changeSort(0);
          print("In Category ID: ${widget.obj.id}");
          print("In Category is_new: ${widget.obj.is_new}");
          print("In Category favorite: ${widget.obj.favorite}");
          Navigator.push(
            context,
            widget.obj.is_new
                ? MaterialPageRoute(
                    builder: (context) => API_Get(
                        URL: "$IP/api/new/${widget.obj.id}",
                        ApiName: ApiTags.detal,
                        Return: DetalPage(
                          place: _place2,
                            obj: widget.obj,
                            isfavorite:
                                widget.isFavorite /*list[index].favorite*/,
                            index: widget.index)))
                : MaterialPageRoute(
                    builder: (context) => API_Get(
                        URL: "$IP/api/event/${widget.obj.id}",
                        ApiName: ApiTags.detal,
                        Return: DetalPage(
                          place: _place2,
                          obj: widget.obj,
                          isfavorite:
                              widget.isFavorite /*list[index].favorite*/,
                          index: widget.index,
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
            /* gradient: LinearGradient(
            colors: [
              Colors.yellow[300],
              Colors.white
            ]
          )*/
            color: ThemeProvided().colorCanvas,
          ),
          margin: EdgeInsets.all(SWi * 0.005),
          width: SWi,
          height: SWi * 0.3,
          child: widget.obj.is_new?
              ClipRect(
                child: Banner(
                  color: Colors.red,
                  message: "Täze",

                  location: BannerLocation.topStart,
                child: InCategoriStak(_place),),
              ):
          InCategoriStak(_place),
        ),
      ),
    );
  }

  Stack InCategoriStak(String _place) {
    return Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
                right: 0,
                top: 0,
                child: FavoriteBtn(
                  // onTop: widget.favoriteFunc,
                  favorite: widget.isFavorite,
                  obj: widget.obj,
                  index: widget.index,
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
                  imageUrl: "$IP/storage/${widget.obj.public_image}",
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
                        child: Text("${widget.obj.shortName()}",
                            style: TextStyle(
                                fontSize: SWi * 0.043,
                                fontFamily: "NunitoRegular",
                                fontWeight: FontWeight.w900))),
                    SizedBox(height: SWi * 0.01),
                    Container(
                      child: Text("${widget.obj.price} TMT",
                          style: TextStyle(
                              fontSize: SWi * 0.04,
                              fontFamily: "NunitoRegular")),
                    ),
                    SizedBox(height: SWi * 0.01),
                    Text(
                        _place,
                        style: TextStyle(
                            fontSize: SWi * 0.037,
                            fontFamily: "NunitoRegular",
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: SWi * 0.01),
                    Text(
                        "${widget.obj.data.day}.${widget.obj.data.month}.${widget.obj.data.year}",
                        style: TextStyle(
                            fontSize: SWi * 0.03,
                            fontFamily: "NunitoRegular",
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            /*  Positioned(
              left: SWi * 0.09,
              bottom: SWi * 0.001,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.obj.place}",
                        style: TextStyle(
                            fontSize: SWi * 0.037,
                            fontFamily: "NunitoRegular",
                            fontWeight: FontWeight.w500)),
                    Text(
                        "${widget.obj.data.day}.${widget.obj.data.month}.${widget.obj.data.year}",
                        style: TextStyle(
                            fontSize: SWi * 0.03,
                            fontFamily: "NunitoRegular",
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),*/
          ],
        );
  }
}
