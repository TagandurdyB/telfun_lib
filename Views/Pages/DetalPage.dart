import 'package:flutter/material.dart';
import 'package:telfun/ViewModels/ApiDebuging.dart';
import 'package:telfun/Views/widgets/imgBtn.dart';
import 'package:url_launcher/url_launcher.dart';
import '/Models/Public.dart';
import '/Views/widgets/ScaffoldParts/ScaffoldAll.dart';

class DetalPage extends StatelessWidget {
  final String image, name, phone, price, place, about, mark;
  DetalPage(
      {Key key,
      @required this.image,
      this.name = "",
      this.phone = "",
      this.price = "",
      this.place = "",
      this.about = "",
      this.mark = ""})
      : super(key: key);

  void tellCall(String phone)async{
    launch("tel://$phone");
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAll(
        body: Container(
      child: ListView(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: ImgBtn(
                width: double.infinity,
                height: SWi,
                //  color: Colors.,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Zoom(image: image)));
                },
                shape: 30,
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 0)
                ],
                child: Image.network("$IP/storage/$image"),
              )),
          EventDetal(),
        ],
      ),
    ));
  }

  Widget EventDetal() {
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
                    TextSpan(text: name)
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
                    TextSpan(text: mark)
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(text: "Bahasy : ", style: TextStyle(fontSize: 18)),
                    TextSpan(text: price)
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
                    TextSpan(text: place)
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
                    child: Text(about),
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
                  Text(phone),
                  IconButton(
                      onPressed: () {
                        tellCall(phone);
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
  final String image;
  const Zoom({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                    child: Image.network("$IP/storage/$image"))),
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
    ));
  }
}
