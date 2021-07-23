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
        '/': (context) => StudentList(),
        '/Notas': (context) => StudentListGrade(),
        '/Cadastro': (context) => StudentForm(),
      },
    );
  }
}
