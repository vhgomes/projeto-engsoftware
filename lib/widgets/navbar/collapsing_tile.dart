import 'package:flutter/material.dart';
import 'package:project/theme/navbar_theme.dart';

class CollapsingTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final Function()? onTap;

  CollapsingTile({
    required this.title,
    required this.icon,
    required this.animationController,
    this.isSelected = false,
    this.onTap,
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
      end: 65,
    ).animate(widget.animationController);
    sizedBoxAnimation = Tween<double>(
      begin: 10,
      end: 0,
    ).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          children: <Widget>[
            Icon(
              widget.icon,
              color: Color(0xffffffff),
              size: 33.0,
            ),
            SizedBox(width: sizedBoxAnimation.value),
            (widthAnimation.value >= 230)
                ? Text(
                    widget.title,
                    style: widget.isSelected
                        ? listTileDefaultTextStyle
                        : listTileDefaultTextStyle,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
