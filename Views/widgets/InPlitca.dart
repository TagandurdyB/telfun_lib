import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import '/Views/Pages/DetalPage.dart';
import '/Models/Public.dart';
import 'imgBtn.dart';

class InCategory extends StatelessWidget {
  const InCategory({
    Key key,
    @required this.list,
    @required this.index,
  }) : super(key: key);

  final List list;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SWi * 0.02, vertical: SWi * 0.017),
      child: ImgBtn(
        color: Color(0xff6A00FF),
        onTap: () {
        /*  print(
              "${list[index]["image"]} ${list[index]["name"]}  ${list[index]["price"]} ${list[index]["place"]} ${list[index]["about"]}");
          //print("${list[index]["user"]["phone"]}");*/
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetalPage(
                        image: list[index]["image"],
                        name: list[index]["name"],
                        phone: list[index]["user_phone"],
                        price: list[index]["price"],
                        about: list[index]["about"],
                        place: list[index]["place"],
                        mark:  list[index]["mark"]["name"],
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
                  child: Image.network(
                      "$IP/storage/${list[index]["public_image"]}"),
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
