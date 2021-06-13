import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/logo.png',
  'assets/images/slider2.png',
  'assets/images/slider3.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover),
                  ],
                )),
          ),
        ))
    .toList();
