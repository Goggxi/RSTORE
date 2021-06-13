import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color primary = Color(0xffFF3B5A);
const Color accent = Color(0xffFF5B55);
const Color accent2 = Color(0xffFF1161);
const Color accent3 = Color(0xffFF4159);
const Color white = Color(0xffFFFFFF);

// ignore: non_constant_identifier_names
MaterialColor PRIMARYPINK = _factoryColor(0xffFF3B5A);

MaterialColor _factoryColor(int color) {
    return MaterialColor(color, <int, Color>{
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color),
    });
  }