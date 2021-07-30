import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';

import 'package:project/widgets/login/inputs_builder.dart';
import 'package:project/widgets/login/button_builder.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  color: Color(0xff2A3659),
                  border: Border.all(
                    color: Color(0xff2A3659),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    InputLoginPage(
                      icon: Icons.email,
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InputLoginPage(
                      icon: Icons.password,
                      hintText: 'Password',
                      hideText: true,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    loginButtonBuilder()
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
      ),
    );
  }
}
