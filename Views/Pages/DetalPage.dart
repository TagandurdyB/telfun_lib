import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';
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
  final int /*index,*/ id;
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
    List list = Get_Lists(apiName: ApiTags.detal).getList();
    // print("++++++++++IMAGES:${list[0].images}");
    return ScaffoldAll(
      phone: list[0].phone,
      IsFloatBtn: true,
      body: Container(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(children: [
              Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      // padding: EdgeInsets.all(8),
                      width: SWi,
                      height: SWi,
                      child: PageView.builder(
                          itemCount: list[0].images.length, //image.length,
                          itemBuilder: (context, index) => ImgBtn(
                            width: double.infinity,
                            height: SWi,
                            //  color: Colors.,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Zoom(
                                          images: list[0].images, index: index)));
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
                              imageUrl:
                              "$IP/storage/${list[0].images[index]["image"]}",
                              fit: BoxFit.cover,
                            ),
                          ))),
                  eventProfil(list),
                ],
              ),
Positioned(
    bottom: SWi*0.18,
    right: SWi*0.1,
    child: ImgBtn(
      width: SWi*0.15,
      height:  SWi*0.15,
      shape: SWi*0.1,
      color: Colors.white,
      boxShadow: [BoxShadow(offset: Offset(0,2.5),color: Color(0xffD7BFFC),blurRadius: 2.5)],
      child:  Icon(Icons.bookmark,size: SWi*0.09,color: Color(0xff6A00FF)),),
    )
            ]),

            EventDetal(list, context),
          ],
        ),
      ),
    );
  }

  Widget eventProfil(List list){
    return  ImgBtn(
      width: double.infinity,
      height: SWi * 0.25,
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey, offset: Offset(0, 5), blurRadius: 5)
      ],
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SWi * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        // TextSpan(text: "Ady : ", style: TextStyle(fontSize: 18)),
                        TextSpan(
                            text: list[0].name,
                            style: TextStyle(fontSize: 18))
                      ])),
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      children: [
                        /*TextSpan(text: "Bahasy : ", style: TextStyle(fontSize: 18)),*/
                        TextSpan(
                            text: list[0].price.toString() + " TMT",
                            style: TextStyle(fontSize: 16))
                      ])),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        /* TextSpan(
                          text: "Goýulan ýeri : ",
                          style: TextStyle(fontSize: 18)),*/
                        TextSpan(text: list[0].place)
                      ])),
              Row(children: [
                /* TextSpan(
                          text: "Goýulan ýeri : ",
                          style: TextStyle(fontSize: 18)),*/
                Text(
                  "${list[0].data.day}.${list[0].data.month}.${list[0].data.year}",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Container(
                  padding: EdgeInsets.only(left: SWi * 0.1),
                  child: Icon(
                    Icons.visibility_outlined,
                    size: SWi * 0.05,
                    color: Colors.grey,
                  ),
                ),
                Text(" 435345",
                    style: TextStyle(color: Colors.grey[700]))
                // TextSpan()
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget EventDetal(List list, BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                   */ /* TextSpan(
                        text: "Markasy : ", style: TextStyle(fontSize: 18)),*/ /*
                    TextSpan(text: list[0].mark)
                  ])),
            ),*/

            Container(
                padding: EdgeInsets.all(SWi * 0.07),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Text(
                            "i",
                            style: TextStyle(color: Colors.white),
                          ),
                          radius: SWi * 0.035,
                          backgroundColor: Color(0xff6A00FF),
                        ),
                        Text(
                          " Giňişleýin maglumat",
                          style: TextStyle(
                              fontSize: SWi * 0.04,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: SWi * 0.1),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bölümi"),
                    ),
                    Text(
                        "${Get_Lists(apiName: ApiTags.categori).getList()[Provider.of<UsesVar>(context).getCategoryIndex()].tm}"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Marka"),
                    ),
                    Text("${list[0].mark}"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Model"),
                    ),
                    Text("${list[0].name}"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Reňki"),
                    ),
                    Text("${list[0].name}"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Ýyly"),
                    ),
                    Text("2022 .ý"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Ýeri"),
                    ),
                    Text(list[0].place),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bahasy"),
                    ),
                    Text("${list[0].price} TMT"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Goýuldy"),
                    ),
                    Text(
                        "${list[0].data.day}.${list[0].data.month}.${list[0].data.year}"),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Telefon belgisi"),
                    ),
                    Text("${list[0].phone}"),
                  ]),
                  /*TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text(
                        "Barada : ",

                      ),
                    ),
                    Text("")

                  ]),*/
                ],
              ),
            ),
            SizedBox(height: SWi * 0.05),
            /* Container(
              padding: EdgeInsets.symmetric(horizontal:SWi*0.),
              //  alignment: Alignment.center,
                child: ),*/
            ImgBtn(
              width: null,
              height: null,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -5), color: Colors.grey, blurRadius: 5)
              ],
              child: Align(
                alignment: Alignment.center,
                child: ImgBtn(
                    /* boxShadow: [
                   //   BoxShadow(color: Colors.blue, blurRadius: 1, spreadRadius: 0)
                    ],*/
                    color: Colors.white,
                    width: SWi * 0.95,
                    height: null,
                    // shape: 15,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(list[0].about),
                      ),
                    )),
              ),
            ),

            /* Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: SWi*0.02,vertical: SWi*0.01),
                    child: ImgBtn(
                      onTap: (){
                        tellCall(list[0].phone);
                      },
                      shape: SWi*0.02,
                      width: null,
                      height: SWi*0.1,
                      color: Color(0xff6900FE),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("JAŇ ETMEK",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                  // child: OutlinedButton(
                  //   onPressed: () {
                  //     Provider.of<UsesVar>(context, listen: false)
                  //         .changeMark(-1, -1);
                  //   },
                  //   child: Text("Hemmesini görmek",
                  //       style: TextStyle(
                  //           color: Provider.of<UsesVar>(context).getMark()[1] == -1
                  //               ? Color(0xff9747FF)
                  //               : Colors.grey,
                  //           fontSize: SWi * 0.035)),
                  //   style: OutlinedButton.styleFrom(
                  //     side: BorderSide(
                  //         color: Provider.of<UsesVar>(context).getMark()[1] == -1
                  //             ? Color(0xff9747FF)
                  //             : Colors.grey,
                  //         width: Provider.of<UsesVar>(context).getMark()[1] == -1
                  //             ? 2
                  //             : 1),
                  //     shape: StadiumBorder(),
                  //   ),
                  // ),
                ),
              ],
            ),*/

            /* Row(
              children: [
                Container(
                  //padding: EdgeInsets.all(SWi*0.02),
                  child:
                ClipRRect(
                //  borderRadius: BorderRadius.circular(SWi*0.1),
                  child: MaterialButton(

                    onPressed: () {

                    },
                  //  height: SWi*0.09,
                    color:  Color(0xff5408BF),
                    child: Text(
                      "JAŇ ETMEK",
                      style: TextStyle(color: Colors.white,fontSize: SWi*0.05),
                    ),
                  ),
                ),),
              ],
            )*/
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
                                cacheManager: CacheManager(Config(
                                    "events_detal",
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
                                imageUrl:
                                    "$IP/storage/${images[index]["image"]}",
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
