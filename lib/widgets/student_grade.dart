import 'package:flutter/material.dart';

class Studentgrade extends StatelessWidget {
  final String name;
  final double nota1;
  final double nota2;
  final double media;

  Studentgrade({
    required this.name,
    required this.nota1,
    required this.nota2,
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff2DA690),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              name,
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
                      Text(
                        nota1.toString(),
                        style: TextStyle(
                          color: Color(0xFFF2EDDC),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        nota2.toString(),
                        style: TextStyle(
                          color: Color(0xFFF2EDDC),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        media.toString(),
                        style: TextStyle(
                          color: Color(0xFFF2EDDC),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => {},
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
