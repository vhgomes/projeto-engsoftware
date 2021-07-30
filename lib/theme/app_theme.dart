import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData colorTheme() {
    return ThemeData(
      fontFamily: 'ComicNeue',
    );
  }

  static BoxDecoration backgroudTheme() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xff268C82),
          Color(0xff2DA690),
        ],
      ),
    );
  }
}
