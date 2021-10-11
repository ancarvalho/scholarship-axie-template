import 'package:flutter/painting.dart';

class TrophyColor {
  final Color color;

  TrophyColor(this.color);

  static getTrophyColor(int position) {
    switch (position) {
      case 0:
        return TrophyColor(Color(0xffFFD700));
      case 1:
        return TrophyColor(Color(0xffC0C0C0));
      case 2:
        return TrophyColor(Color(0xffcd7f32));
      default:
        return null;
    }
  }
}