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
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Nota 1'),
                    Text('Nota 2'),
                    Text('Media'),
                  ],
                ),
                height: 50,
                color: Color(0xFFF268C82),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('8.9'),
                    Text('6.5'),
                    Text('7.7'),
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
}
