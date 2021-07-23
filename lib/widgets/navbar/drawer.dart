import 'package:flutter/material.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/models/navigation_model.dart';
import 'package:project/widgets/navbar/collapsing_tile.dart';

class NavigationDrawerWidget extends StatefulWidget {
  final List<NavigationModel> navigationOptions;
  final String title;

  NavigationDrawerWidget({
    required this.navigationOptions,
    required this.title,
  });

  @override
  NavigationDrawerWidgetState createState() {
    return new NavigationDrawerWidgetState();
  }
}

class NavigationDrawerWidgetState extends State<NavigationDrawerWidget>
    with SingleTickerProviderStateMixin {
  double maxWidth = 230;
  double minWidth = 65;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

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
        builder: (context, _widget) => getWidget(context, _widget));
  }

  Widget getWidget(context, _widget) {
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
              title: widget.title,
              icon: Icons.account_circle,
              animationController: _animationController,
            ),
            Divider(
              color: Color(0xff2A3659),
              height: 10,
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
                    onTap: () {
                      setState(
                        () {
                          currentSelectedIndex = index;
                        },
                      );
                      if (widget.navigationOptions[index].title ==
                          'Lista de Alunos') {
                        Navigator.pushNamed(context, '/');
                      }
                      if (widget.navigationOptions[index].title == 'Notas') {
                        Navigator.pushNamed(context, '/Notas');
                      }

                      if (widget.navigationOptions[index].title ==
                          'Novo Aluno') {
                        Navigator.pushNamed(context, '/Cadastro');
                      }
                    },
                    isSelected: currentSelectedIndex == index,
                    title: widget.navigationOptions[index].title,
                    icon: widget.navigationOptions[index].icon,
                    animationController: _animationController,
                  );
                },
                itemCount: widget.navigationOptions.length,
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
