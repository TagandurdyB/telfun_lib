import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/ViewModels/ApiDebuging.dart';
import '/Models/Public.dart';

class Slider_pro extends StatefulWidget {
  @override
  _Slider_proState createState() => _Slider_proState();
}

class _Slider_proState extends State<Slider_pro> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: SWi * 0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(SWi * 0.05),
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 10)
                ],
                color: Colors.transparent),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(SWi * 0.05),
              child: Carousel(
                onImageChange: (i, r) {
                  setState(() {
                    _current = r;
                  });
                },
                images: List.generate(
                    Get_Lists().getList(Get_Lists.img).length?? 0,
                    (index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                           image: DecorationImage(
                             fit: BoxFit.cover,
                             image: NetworkImage("$IP/storage/${Get_Lists().getList(Get_Lists.img)[index]["image"]}")
                           )
                          ),
                        )),
                /* dotSize: 6.0,
                dotSpacing: 15.0,
                dotColor: Colors.white,
                dotIncreasedColor: Color(0xff7262DF),
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,*/
                showIndicator: false,
              ),
            ),
          ),
          Visibility(
            visible: (Get_Lists().getList("img").length>0&&Get_Lists().getList("img").length!=null),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              child: AnimatedSmoothIndicator(
                activeIndex: _current,
                count: Get_Lists().getList("img")!=null?Get_Lists().getList("img").length:1,
                effect: SwapEffect(
                    dotColor: Colors.grey[300],
                    activeDotColor: Color(0xff7262DF),
                    dotWidth: 8,
                    dotHeight: 8),
              ),
            ),
          )
        ],
      ),
    );
  }
}
