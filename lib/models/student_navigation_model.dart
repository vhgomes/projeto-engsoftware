import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({
    required this.icon,
    required this.title,
  });
}

List<NavigationModel> navigationitem = [
  NavigationModel(
    title: "Notas",
    icon: Icons.dns,
  ),
  NavigationModel(
    title: "Sair",
    icon: Icons.logout,
  ),
];
