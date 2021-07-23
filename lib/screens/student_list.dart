import 'package:flutter/material.dart';
import 'package:project/models/navigation_model.dart';
import 'package:project/models/student_model.dart';

import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/student_item.dart';
import 'package:project/widgets/navbar/drawer.dart';

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
      drawer: NavigationDrawerWidget(
        title: 'Professor',
        navigationOptions: [
          NavigationModel(
            title: "Lista de Alunos",
            icon: Icons.group,
          ),
          NavigationModel(
            title: "Notas",
            icon: Icons.dns,
          ),
          NavigationModel(
            title: "Novo Aluno",
            icon: Icons.person,
          ),
          NavigationModel(
            title: "Sair",
            icon: Icons.logout,
          ),
        ],
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
