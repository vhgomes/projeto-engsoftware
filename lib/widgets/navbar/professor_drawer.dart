import 'package:flutter/material.dart';
import 'package:project/widgets/navbar/drawer.dart';
import 'package:project/models/navigation_model.dart';

class ProfessorDrawer extends StatelessWidget {
  const ProfessorDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawerWidget(
      title: 'Professor',
      navigationOptions: [
        NavigationModel(
          title: "Lista de Alunos",
          icon: Icons.group,
          route: '/Lista%20Estudante',
        ),
        NavigationModel(
          title: "Notas",
          icon: Icons.dns,
          route: '/Notas%20Professor',
        ),
        NavigationModel(
          title: "Novo Aluno",
          icon: Icons.person,
          route: '/Cadastro',
        ),
        NavigationModel(
          title: "Sair",
          icon: Icons.logout,
          route: '/',
        ),
      ],
    );
  }
}
