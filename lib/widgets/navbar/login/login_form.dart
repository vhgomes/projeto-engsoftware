import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: AppTheme.backgroudTheme(),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: ((MediaQuery.of(context).size.width) / 13.66) * 4,
              vertical: 120,
            ),
            child: Container(
              height: 400,
              width: 200,
              decoration: BoxDecoration(
                //color: Color(0xff2A3659),
                border: Border.all(
                    //color: Color(0xff2A3659),
                    ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 200) / 2,
          top: 10,
          child: Icon(
            Icons.local_library,
            color: Colors.white,
            size: 200,
          ),
        ),
      ],
    );
  }
}
