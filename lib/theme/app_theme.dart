import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData colorTheme(context) {
    return ThemeData(
      fontFamily: 'ComicNeue',
      buttonTheme: ButtonTheme.of(context).copyWith(
        buttonColor: Color(0xff2A3659),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
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
