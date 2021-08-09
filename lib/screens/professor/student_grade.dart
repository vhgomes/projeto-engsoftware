import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/student_grade.dart';
import 'package:project/widgets/navbar/professor_drawer.dart';

class StudentListGrade extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: ProfessorDrawer(),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('student').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = streamSnapshot.data!.docs;

          return Container(
            decoration: AppTheme.backgroudTheme(),
            child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: documents.length,
                itemBuilder: (context, index) => Container(
                      child: StudentGrade(
                        name: documents[index]['name'],
                        nota1: 0,
                        nota2: 0,
                        media: 0,
                      ),
                    )),
          );
        },
      ),
    );
  }
}
