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
          child: Center(
            child: Card(
              color: Color(0xff2A3659),
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 250),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(80),
                  child: Form(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                              color: Colors.cyan,
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                              color: Colors.cyan,
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Login'),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: (MediaQuery.of(context).size.width - 200) / 2,
          top: 40,
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
