import 'package:flutter/material.dart';
import 'package:project/models/user.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/models/student_model.dart';
import 'package:project/widgets/student_grade.dart';
import 'package:project/widgets/navbar/professor_drawer.dart';

class StudentListGrade extends StatelessWidget {
  final List<Student> loadedStudents = [
    Student(
      User(
        password: '123',
        name: 'Filipe Marques de Souza',
        isStudent: true,
        uniqueID: 's1',
        email: 'filipe.souza1906@gmail.com',
      ),
      nota1: 7.1,
      nota2: 8.5,
    ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: ProfessorDrawer(),
      body: Container(
        decoration: AppTheme.backgroudTheme(),
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: loadedStudents.length,
          itemBuilder: (context, index) => StudentgradeWidget(
            name: loadedStudents[index].name,
            nota1: loadedStudents[index].nota1,
            nota2: loadedStudents[index].nota2,
            media:
                (loadedStudents[index].nota1 + loadedStudents[index].nota2) / 2,
          ),
        ),
      ),
    );
  }
}
