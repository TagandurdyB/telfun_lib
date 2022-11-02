import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/Models/Public.dart';

class MySlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Carusel_sld();
  }
}

class Carusel_sld extends StatefulWidget {
  @override
  State<Carusel_sld> createState() => _Carusel_sldState();
}

class _Carusel_sldState extends State<Carusel_sld> {
  CarouselController buttonCarouselController = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: SWi,
          height: SWi * 0.5,
          padding: EdgeInsets.all(SWi * 0.02),
          child: CarouselSlider.builder(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                // aspectRatio: 16 / 9,
                //  viewportFraction: 0.8,
                //scrollDirection: Axis.horizontal,
                //autoPlayCurve: Curves.fastOutSlowIn,
                initialPage: 1,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                enlargeCenterPage: false,
                onPageChanged: (i, r) {
                  setState(() {
                    _current = i;
                  });
                }),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                Container(
              margin: EdgeInsets.all(8),
              //width: SWi,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 0,blurRadius: 10)],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(SWi * 0.02),
                color: Colors.black, //list[index % 4],
                /*  image: DecorationImage(
                            fit: BoxFit.fill,
                            image: ,
                          ),*/
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          child: AnimatedSmoothIndicator(
            activeIndex: _current,
            count: 5,
            effect: SwapEffect(
                dotColor: Colors.white,
                activeDotColor: Color(0xff7262DF),
                dotWidth: 8,
                dotHeight: 8),
          ),
        )
      ],
    );
  }
}
