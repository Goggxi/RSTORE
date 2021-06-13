import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rstore/values/colors.dart';

import 'app/main/main_controller.dart';
import 'app/welcome/splash_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      title: 'RSTORE',
      theme: ThemeData(
        primarySwatch: PRIMARYPINK,
      ),
    );
  }
}