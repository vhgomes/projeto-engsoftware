import 'package:flutter/material.dart';

Widget loginButtonBuilder() {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: 200,
          height: 100,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              elevation: 1.5,
              padding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text('Login'),
            onPressed: () => print('Login pressionado'),
          ),
        ),
      ],
    ),
  );
}
