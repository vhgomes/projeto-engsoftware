import 'package:flutter/material.dart';
import 'package:project/screens/student_form.dart';
import 'package:project/screens/student_grade.dart';
import 'package:project/screens/student_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ComicNeue',
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => StudentList(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Notas': (context) => StudentListGrade(),
        '/Cadastro': (context) => StudentForm(),
      },
    );
  }
}
