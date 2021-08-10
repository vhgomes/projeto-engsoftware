import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentGrade extends StatefulWidget {
  final String id;
  final String name;
  final double grade1;
  final double grade2;
  final double average;
  double grade1aux;
  double grade2aux;
  double averageaux;

  StudentGrade({
    required this.id,
    required this.name,
    required this.grade1,
    required this.grade2,
    required this.average,
    this.grade1aux = 0,
    this.grade2aux = 0,
    this.averageaux = 0,
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
            'grade1': widget.grade1aux,
            'grade2': widget.grade2aux,
            'average': widget.averageaux,
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
                        width: 50,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^\d+\.?\d{0,2}"))
                          ],
                          enabled: isEnable,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: widget.grade1.toString(),
                            hintStyle: (TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF2EDDC),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          onChanged: (value) {
                            widget.grade1aux = double.parse(value);
                          },
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r"^\d+\.?\d{0,2}"))
                          ],
                          enabled: isEnable,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: widget.grade2.toString(),
                            hintStyle: (TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF2EDDC),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                          onChanged: (value) {
                            widget.grade2aux = double.parse(value);
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
                      if (isEnable == false)
                        isEnable = !isEnable;
                      else {
                        widget.averageaux =
                            (widget.grade1aux + widget.grade2aux) / 2;
                        updadeGrade();
                        isEnable = !isEnable;
                      }
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
