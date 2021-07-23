import 'package:flutter/material.dart';
import 'package:project/screens/student_form.dart';
import 'package:project/screens/student_grade.dart';
import 'package:project/screens/student_list.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Routes',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => StudentList(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => StudentListGrade(),
        '/thrid': (context) => StudentForm(),
      },
    ),
  );
}
