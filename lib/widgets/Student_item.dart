import 'package:flutter/material.dart';

class StudentItem extends StatelessWidget {
  final String name;
  final String email;

  StudentItem(
    this.name,
    this.email,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(45, 166, 145, 1),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
