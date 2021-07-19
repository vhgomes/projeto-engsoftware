//colapsing_list_tile

import 'package:flutter/material.dart';
import 'package:project/models/theme_NavBar.dart';

class CollapsingTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  CollapsingTile({
    required this.title,
    required this.icon,
    required this.animationController,
  });

  _CState createState() => _CState();
}

class _CState extends State<CollapsingTile> {
  late Animation<double> widthAnimation, sizedBoxAnimation;
  @override
  void initState() {
    super.initState();
    widthAnimation = Tween<double>(
      begin: 230,
      end: 55,
    ).animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(
      begin: 10,
      end: 0,
    ).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Color(0xffF2EDDC),
            size: 35.0,
          ),
          SizedBox(width: sizedBoxAnimation.value),
          (widthAnimation.value >= 220)
              ? Text(
                  widget.title,
                  style: listTileDefaultTextStyle,
                )
              : Container()
        ],
      ),
    );
  }
}
