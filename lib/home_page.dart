import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:itravel/utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final items = [
    Banner(
        Image.network(
          "https://image.freepik.com/free-psd/banner-template-with-adventure-concept_23-2148143954.jpg",
          fit: BoxFit.cover,
        ),
        "Banner 1"),
    Banner(
        Image.network(
          "https://image.freepik.com/free-psd/go-beach-template_23-2148253781.jpg",
          fit: BoxFit.cover,
        ),
        "Banner 2"),
    Banner(
        Image.network(
          "https://image.freepik.com/free-psd/web-banner-template-memphis-style-with-summer-concept_23-2148174717.jpg",
          fit: BoxFit.cover,
        ),
        "Banner 3"),
    Banner(
        Image.network(
          "https://image.freepik.com/free-psd/colorful-summer-party-web-banner-template_23-2148192884.jpg",
          fit: BoxFit.cover,
        ),
        "Banner 4"),
    Banner(
        Image.network(
          "https://image.freepik.com/free-psd/banner-template-summer-festival_23-2148174536.jpg",
          fit: BoxFit.cover,
        ),
        "Banner 5"),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696D77), Color(0xFF292C36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 26,
          ),
          CarouselSlider(
              height: 180.0,
              autoPlay: true,
              aspectRatio: 2.0,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: items),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text("Hot",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(18.0, context),
                    fontFamily: "Montserrat-Bold")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 180.0,
              child: Container(
                color: Colors.tealAccent,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text("Top rating",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(18.0, context),
                    fontFamily: "Montserrat-Bold")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 180.0,
              child: Container(
                color: Colors.tealAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget Banner(Image img, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Stack(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: img,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(color: Colors.lightGreenAccent),
            ),
          ),
        )
      ],
    ),
  );
}
