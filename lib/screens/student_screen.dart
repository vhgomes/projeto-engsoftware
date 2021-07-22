import 'package:flutter/material.dart';
import 'package:project/models/theme_NavBar.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Page'),
          centerTitle: true,
          backgroundColor: drawerBGClor,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff268C82),
                Color(0xff2DA690),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
