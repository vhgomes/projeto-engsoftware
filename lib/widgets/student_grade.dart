import 'package:flutter/material.dart';

class StudentGrade extends StatefulWidget {
  final String name;
  final double nota1;
  final double nota2;
  final double media;

  StudentGrade({
    required this.name,
    required this.nota1,
    required this.nota2,
    required this.media,
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
                          enabled: isEnable,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: widget.nota1.toString(),
                            hintStyle: (TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF2EDDC),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        child: TextFormField(
                          enabled: isEnable,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: widget.nota2.toString(),
                            hintStyle: (TextStyle(
                              fontSize: 22,
                              color: Color(0xFFF2EDDC),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.8),
                        child: Text(
                          widget.media.toString(),
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
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.delete_outlined),
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
