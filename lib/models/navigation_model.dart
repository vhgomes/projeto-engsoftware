import 'package:flutter/material.dart';

class NavigationModel {
  String route;
  String title;
  IconData icon;

  NavigationModel({
    required this.icon,
    required this.title,
    required this.route,
  });
}
