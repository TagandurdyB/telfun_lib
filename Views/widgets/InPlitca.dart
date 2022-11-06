import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import '/Views/Pages/DetalPage.dart';
import '/Models/Public.dart';
import 'imgBtn.dart';

class InCategory extends StatelessWidget {
  const InCategory({
    Key key,
    @required this.list,@required this.index,
  }) : super(key: key);

  final List list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      "$IP/storage/${list[index]["image"][0]["image"]}"),
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
    );
  }
}