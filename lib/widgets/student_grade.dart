import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

// ignore: must_be_immutable
class StudentGrade extends StatefulWidget {
  final String id;
  final String name;
  double grade1;
  double grade2;
  double average;

  StudentGrade({
    required this.id,
    required this.name,
    required this.grade1,
    required this.grade2,
    required this.average,
  });
  @override
  StudentGradeState createState() {
    return new StudentGradeState();
  }
}

class StudentGradeState extends State<StudentGrade> {
  bool isEnable = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference grades =
        FirebaseFirestore.instance.collection('student');

    Future<void> updadeGrade() {
      return grades
          .doc(widget.id)
          .update({
            'grade1': widget.grade1,
            'grade2': widget.grade2,
            'average': double.parse(
                ((widget.grade1 + widget.grade2) / 2).toStringAsFixed(2)),
          })
          .then((value) => print("Ataulizado com sucesso"))
          .catchError((error) => print('Não foi possivel atualizar'));
    }

    return Card(
      color: Color(0xff2DA690),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              widget.name,
              style: TextStyle(
                color: Color(0xFFF2EDDC),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Wrap(
              spacing: 25,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 110, top: 10),
                  child: Wrap(
                    spacing: 25,
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^\d+\.?\d{0,2}"))
                          ],
                          enabled: isEnable,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: widget.grade1.toString(),
                            hintStyle: (TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF2EDDC),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          onChanged: (value) {
                            widget.grade1 = min(double.parse(value), 10);
                            updadeGrade();
                          },
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^\d+\.?\d{0,2}"))
                          ],
                          enabled: isEnable,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                            hintText: widget.grade2.toString(),
                            hintStyle: (TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF2EDDC),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          onChanged: (value) {
                            widget.grade2 = min(double.parse(value), 10);
                            updadeGrade();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.8),
                        child: Text(
                          widget.average.toString(),
                          style: TextStyle(
                            color: Color(0xFFF2EDDC),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isEnable = !isEnable;
                    });
                  },
                  icon: Icon(Icons.edit),
                  hoverColor: Color(0xff268C82),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
