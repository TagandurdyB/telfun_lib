import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import '/Views/Pages/DetalPage.dart';
import '/Models/Public.dart';
import 'imgBtn.dart';

class InCategory extends StatelessWidget {
  List list;
  final int index;

   InCategory({

   this.list,
    @required this.index,
  }) ;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SWi * 0.02, vertical: SWi * 0.017),
      child: ImgBtn(
        color: Color(0xff6A00FF),
        onTap: () {
      // print("++++++++++++++++++ID:${Get_Lists().getList(Get_Lists.events)[0]["mark"]}");
       list=Get_Lists().getList(Get_Lists.events);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Get_api(
                    URL: "$IP/api/event/${list[index]["id"]}",
                    ApiName: Get_Lists.eventDetal,
                    Return: DetalPage(
                        //  image: list[index]["image"],
                          name: list[index]["name"],
                          phone: list[index]["user"]["phone"],
                          price: list[index]["price"],
                          about: list[index]["about"],
                          place: list[index]["place"],
                          mark:  list[index]["mark"]["name"],
                        ),
                  )));
        },
        boxShadow: [
          BoxShadow(spreadRadius: 0, blurRadius: 5, color: Colors.grey)
        ],
        width: null,
        height: null,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(SWi * 0.005),
          width: SWi,
          height: SWi * 0.3,
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
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
                        stalePeriod: Duration(days: 15), maxNrOfCacheObjects: 200)),
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
                    imageUrl:
                    "$IP/storage/${list[index]["public_image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: Container(
                  // color: Colors.red,
                  padding: EdgeInsets.all(SWi * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Text("${list[index]["name"]}",
                              style: TextStyle(
                                  fontSize: SWi * 0.04,
                                  fontFamily: "NunitoRegular"))),
                      SizedBox(height: SWi * 0.01),
                      /*    Container(
                        child: Text("${list[index]["place"]}",
                            style: TextStyle(
                                fontSize: SWi * 0.04,
                                fontFamily: "Itim")),
                      ),*/
                      Container(
                        child: Text("${list[index]["price"]} TMT",
                            style: TextStyle(
                                fontSize: SWi * 0.045,
                                fontFamily: "NunitoRegular",
                                fontWeight: FontWeight.w900)),
                      ),
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
