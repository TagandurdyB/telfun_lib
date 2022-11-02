import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telfun/Views/Pages/DetalPage.dart';
import '/Models/Public.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Views/widgets/SortBtn.dart';
import '/Views/widgets/imgBtn.dart';

class AllPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List list = Get_Lists()
        .getList(Get_Lists.events)
        .where((element) => element["category_id"] == categoriId)
        .toList();
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SortBtn(),
        Container(
          alignment: Alignment.center,
          child: Wrap(
              spacing: SWi * 0.02,
              runSpacing: SWi * 0.04,
              children: List.generate(
                  list.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(top: SWi * 0.05),
                        child: ImgBtn(
                          color: Colors.white,
                          onTap: () {
                            print(
                                "${list[index]["image"]} ${list[index]["name"]}  ${list[index]["price"]} ${list[index]["place"]} ${list[index]["about"]}");
                            print("${list[index]["user"]["phone"]}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetalPage(
                                          image: list[index]["image"],
                                      name: list[index]["name"],
                                      phone: list[index]["user"]["phone"],
                                      price: list[index]["price"],
                                      about: list[index]["about"],
                                      place: list[index]["place"],
                                      mark: list[index]["mark"]["name"],
                                        )));
                          },
                          boxShadow: [
                            BoxShadow(spreadRadius: 0, blurRadius:3,color: Colors.grey,offset: Offset(2,2))
                          ],
                          shape: SWi * 0.03,
                          width: SWi*0.45,
                          height: SWi * 0.55,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(SWi * 0.03),
                            child: Container(
                              width: SWi*0.45,
                              height: SWi * 0.55,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                       Container(
                                         margin: EdgeInsets.only(top: SWi*0.05),
                                    decoration: BoxDecoration(
                                      //  color: Colors.grey[400],
                                    ),
                                    width: SWi*0.35,
                                    height: SWi * 0.35,
                                         child: Image.network(
                                             "$IP/storage/${list[index]["image"]}"),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      width: SWi*0.45,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: Text(
                                                  "${list[index]["name"]}",
                                                  style: TextStyle(
                                                      fontSize: SWi * 0.05,
                                                      fontFamily:
                                                          "NunitoRegular"))),
                                          Container(
                                            child: Text("${list[index]["place"]}",
                                                style: TextStyle(
                                                    fontSize: SWi * 0.04,
                                                    fontFamily: "Itim")),
                                          ),
                                          Container(
                                            child: Text("${list[index]["price"]} TMT",
                                                style: TextStyle(
                                                    fontSize: SWi * 0.045,
                                                    fontFamily:
                                                        "NunitoRegular")),
                                          ),
                                        ],
                                      ),
                                      color: Colors.white,
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      ))),
        ),
      ],
    );
  }
}
