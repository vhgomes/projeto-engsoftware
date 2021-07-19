//colapsing_navgation_drawer

import 'package:flutter/material.dart';
import 'package:project/models/theme_NavBar.dart';
import 'package:project/models/navigation_model.dart';
import 'package:project/screens/collapsing_tile.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  NavigationDrawerWidgetState createState() {
    return new NavigationDrawerWidgetState();
  }
}

class NavigationDrawerWidgetState extends State<NavigationDrawerWidget>
    with SingleTickerProviderStateMixin {
  double maxWidth = 230;
  double minWidth = 55;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;

  get elevation => null;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    widthAnimation = Tween<double>(
      begin: maxWidth,
      end: minWidth,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return ClipRRect(
      borderRadius: new BorderRadius.only(
        topRight: const Radius.circular(5),
        bottomRight: const Radius.circular(5),
      ),
      child: Container(
        width: widthAnimation.value,
        color: drawerBGClor,
        child: Column(
          children: <Widget>[
            CollapsingTile(
              title: 'Professor',
              icon: Icons.account_circle,
              animationController: _animationController,
            ),
            Divider(
              color: Colors.grey,
              height: 30,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 12,
                  );
                },
                itemBuilder: (context, index) {
                  return CollapsingTile(
                    title: navigationitem[index].title,
                    icon: navigationitem[index].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: navigationitem.length,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Color(0xffFCEDDC),
                size: 30,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
