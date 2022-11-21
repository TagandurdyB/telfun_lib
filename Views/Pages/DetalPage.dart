import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:telfun/ViewModels/ApiElements.dart';
import 'package:telfun/ViewModels/ApiConverter.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/ViewModels/Names.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Models/Public.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

class DetalPage extends StatelessWidget {
/*  final String name, phone, price, place, about, mark;
  final List image;*/
  final int /*index,*/id;
  DetalPage(
      {Key key,
    /*  @required this.image,
      this.name = "",
      this.phone = "",
      this.price = "",
      this.place = "",
      this.about = "",
      this.mark = "",
      this.index,*/
      this.id})
      : super(key: key);

  void tellCall(String phone) async {
    launch("tel://$phone");
  }

  @override
  Widget build(BuildContext context) {
    List list=Get_Lists(apiName:ApiTags.eventDetal).getList();
   // print("++++++++++IMAGES:${list[0].images}");
    return ScaffoldAll(
        body: Container(
      child: ListView(
          children: [
            Container(
                alignment: Alignment.center,
                // padding: EdgeInsets.all(8),
                width: SWi,
                height: SWi,
                child: PageView.builder(
                    itemCount: list[0].images.length,//image.length,
                    itemBuilder: (context, index) => ImgBtn(
                          width: double.infinity,
                          height: SWi,
                          //  color: Colors.,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Zoom(images: list[0].images, index: index)));
                          },
                          shape: 30,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                          child: CachedNetworkImage(
                            cacheManager: CacheManager(Config("events_detal",
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
                            imageUrl: "$IP/storage/${
                               list[0].images[index]["image"]}",
                            fit: BoxFit.cover,
                          ),
                        ))),
            EventDetal(list),
          ],
      ),
    ),
        );
  }

  Widget EventDetal(List list) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(text: "Ady : ", style: TextStyle(fontSize: 18)),
                    TextSpan(text: list[0].name)
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "Markasy : ", style: TextStyle(fontSize: 18)),
                    TextSpan(text: list[0].mark)
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(text: "Bahasy : ", style: TextStyle(fontSize: 18)),
                    TextSpan(text: list[0].price.toString())
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "Goýulan ýeri : ",
                        style: TextStyle(fontSize: 18)),
                    TextSpan(text: list[0].place)
                  ])),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "Düşündüriş : ",
                  style: TextStyle(fontSize: 20),
                )),
            ImgBtn(
                boxShadow: [
                  BoxShadow(color: Colors.blue, blurRadius: 1, spreadRadius: 0)
                ],
                color: Colors.white,
                width: SWi * 0.9,
                height: null,
                shape: 15,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(list[0].about),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Habarlaşmak üçin : ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(list[0].phone),
                  IconButton(
                      onPressed: () {
                        tellCall(list[0].phone);
                      },
                      icon: Icon(Icons.phone, color: Colors.green))
                ],
              ),
            ),
          ]),
    );
  }
}

class Zoom extends StatelessWidget {
  final List images;
  final int index;
  Zoom({Key key, this.images, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController controler = PageController(initialPage: index);
    return Scaffold(
        body: PageView.builder(
            controller: controler,
            itemCount: images.length,
            itemBuilder: (context, index) => SafeArea(
                  child: Stack(
                    children: [
                      Container(
                        width: SWi,
                        height: SHe,
                        color: Colors.black,
                        child: InteractiveViewer(
                            maxScale: 5,
                            child: Hero(
                                tag: "Event",
                                child: CachedNetworkImage(
                                  cacheManager: CacheManager(Config("events_detal",
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
                                  imageUrl: "$IP/storage/${images[index]["image"]}",
                                 // fit: BoxFit.cover,
                                ),
                            )),
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                )));
  }
}
