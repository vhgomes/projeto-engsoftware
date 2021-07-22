import 'package:flutter/material.dart';
import 'package:project/models/theme_NavBar.dart';
import 'package:project/screens/student_navigation_screen.dart';

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
        drawer: NavigationDrawerWidget(),
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
