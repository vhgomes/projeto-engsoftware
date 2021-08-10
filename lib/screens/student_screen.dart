import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/navigation_model.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/navbar/drawer.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? userfromhere = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference user = FirebaseFirestore.instance.collection('student');
    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(userfromhere).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: drawerBGClor,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              drawer: NavigationDrawerWidget(
                navigationOptions: [
                  NavigationModel(
                    icon: Icons.dns,
                    title: 'Notas',
                    route: '/Notas%20Aluno',
                  ),
                  NavigationModel(
                    icon: Icons.logout,
                    title: 'Sair',
                    route: '/',
                  ),
                ],
                title: 'Aluno',
              ),
              body: Container(
                decoration: AppTheme.backgroudTheme(),
                child: ListView(
                  padding: const EdgeInsets.all(10.0),
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Nota 1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Nota 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'Média',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      height: 50,
                      color: Color(0xFFF268C82),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${data['grade1']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${data['grade2']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '${data['average']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      height: 50,
                      color: Color(0xFFF2DA690),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Text(" ");
      },
    );
  }
}