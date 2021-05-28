import 'package:flutter/material.dart';

class Styles {
  static final Color primaryColor = hexToColor("062091");
  static final MaterialColor materialColor =
      new MaterialColor(0xFF062091, colorCodes);

  static Map<int, Color> colorCodes = {
    50: Color.fromRGBO(6, 32, 145, .1),
    100: Color.fromRGBO(6, 32, 145, .2),
    200: Color.fromRGBO(6, 32, 145, .3),
    300: Color.fromRGBO(6, 32, 145, .4),
    400: Color.fromRGBO(6, 32, 145, .5),
    500: Color.fromRGBO(6, 32, 145, .6),
    600: Color.fromRGBO(6, 32, 145, .7),
    700: Color.fromRGBO(6, 32, 145, .8),
    800: Color.fromRGBO(6, 32, 145, .9),
    900: Color.fromRGBO(6, 32, 145, 1),
  };

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
