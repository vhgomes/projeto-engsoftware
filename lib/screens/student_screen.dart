import 'package:flutter/material.dart';
import 'package:project/models/navigation_model.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/navbar/drawer.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: drawerBGClor,
        ),
        drawer: NavigationDrawerWidget(
          navigationOptions: [
            NavigationModel(icon: Icons.dns, title: 'Notas'),
            NavigationModel(icon: Icons.logout, title: 'Sair'),
          ],
          title: 'Aluno',
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
        ),
      ),
    );
  }
}
