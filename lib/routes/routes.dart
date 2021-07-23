import 'dart:js';

import 'package:flutter/material.dart';
import 'package:project/screens/student_form.dart';
import 'package:project/screens/student_grade.dart';
import 'package:project/screens/student_list.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/Notas': (context) => StudentListGrade(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/Lista%20de%20Alunos': (context) => StudentList(),
        '/Novo%20Aluno': (context) => StudentForm(),
      },
    ),
  );
}
