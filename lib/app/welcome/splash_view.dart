import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rstore/app/welcome/image_slider_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => ImageSliderView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/splash.png', fit: BoxFit.fill),
          ),
          Center(
              child: SizedBox(
                  height: 170, child: Image.asset('assets/images/logo.png'))),
        ],
      ),
    );
  }
}
