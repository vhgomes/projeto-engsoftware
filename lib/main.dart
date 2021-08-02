import 'package:flutter/material.dart';
import 'package:project/screens/login_page.dart';
import 'package:project/screens/student_form.dart';
import 'package:project/screens/student_grade.dart';
import 'package:project/screens/student_list.dart';
import 'package:project/screens/student_screen.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ComicNeue',
      ),
      initialRoute: '/',
      routes: {
        '/Lista%20Estudante': (context) => StudentList(),
        '/Notas%20Professor': (context) => StudentListGrade(),
        '/Cadastro': (context) => StudentForm(),
        '/Notas%20Aluno': (context) => StudentScreen(),
        '/': (context) => LoginPage(), // TODO: Rota inicial login screen
      },
    );
  }
}
