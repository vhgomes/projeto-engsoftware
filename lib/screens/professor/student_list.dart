import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/models/student_model.dart';
import 'package:project/widgets/student_item.dart';
import 'package:project/widgets/navbar/professor_drawer.dart';

class StudentList extends StatelessWidget {
  final List<Student> loadedStudents = [
    Student(
      id: 's1',
      name: 'Filipe Marques de Souza',
      user: 'Filipe.souza',
      email: 'filipe.souza1906@gmail.com',
      password: 'fgreatr',
      nota1: 7.1,
      nota2: 8.5,
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
      ),
      drawer: ProfessorDrawer(),
      body: Container(
        decoration: AppTheme.backgroudTheme(),
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: loadedStudents.length,
          itemBuilder: (context, index) => StudentItem(
            name: loadedStudents[index].name,
            email: loadedStudents[index].email,
          ),
        ),
      ),
    );
  }
}
