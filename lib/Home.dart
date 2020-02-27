import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 
class Images extends StatefulWidget {
  Images() : super();
  @override
  ImagesState createState() => ImagesState();
}
 
class ImagesState extends State<Images> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'images/pic1.jpeg',
    'images/pic2.jpeg',
    'images/pic3.jpeg',
    'images/pic4.jpeg',
    'images/pic5.jpeg',
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
       Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              height: 400.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image(image:AssetImage(
                        imgUrl),
                        fit: BoxFit.fill,
                      ), 
                    );
                  },
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }
} 
