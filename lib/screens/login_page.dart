import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/login/inputs_builder.dart';
import '../widgets/login/button_builder.dart';

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
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    //Nessa parte queria colocar um gradient, porém eu sou pessimo para cores e não faço a minima ideia do que colocar
                    //Deixarei passando por aqui a gente
                    colors: [
                  Color(0xff268C82),
                  Color(0xff268C82),
                  Color(0xff268C82),
                  Color(0xff268C82),
                ])),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: ((MediaQuery.of(context).size.width)/13.66)*4,
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
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
            left: (MediaQuery.of(context).size.width-250)/2,
            top: -50,
            child: Icon(
              Icons.local_library,
              color: Colors.white,
              size: 250,
            ),
          ),
        ],
      ),
    );
  }
}
