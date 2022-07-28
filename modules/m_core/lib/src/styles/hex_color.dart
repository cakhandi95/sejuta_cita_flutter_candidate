import 'package:flutter/material.dart';

///
/// Created by Handy on 17/11/2020
/// HP Probook G1 430.
/// Email : it.handy@borwita.co.id
///

class HexColor extends Color {

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

}