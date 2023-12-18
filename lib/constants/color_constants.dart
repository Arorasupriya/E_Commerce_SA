import 'package:flutter/material.dart';

class ColorsConstants {
  static const Color buttonThemeColor = Color(0xFFFF660E);
  static const Color mainTitleFontColor = Color(0xFF202020);
  static const Color descriptionFontColor = Color(0xFF9f9f9f); //999999
  static Color bgLightColor = Colors.blueGrey.shade50; //Color(0xFFE3E3E3);
  static const Color wholeBgColor = Colors.white;
  static Color gradientLightColor = Colors.white;
  static Color gradientDarkColor = Color(0xFFFF660E);
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write("ff");
    buffer.write(hexString.replaceFirst("#", "0xff"));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : '0x'}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
