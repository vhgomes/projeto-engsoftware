import 'package:flutter/material.dart';
import 'package:project/models/student.dart';
import 'package:project/models/theme_NavBar.dart';
import 'package:project/widgets/Student_item_list.dart';
import 'package:project/screens/navigation_Drawer.dart';

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
      media: 7.8,
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
      ),
      drawer: NavigationDrawerWidget(),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedStudents.length,
        itemBuilder: (context, index) => StudentItem(
          name: loadedStudents[index].name,
          email: loadedStudents[index].email,
        ),
      ),
    );
  }
}
