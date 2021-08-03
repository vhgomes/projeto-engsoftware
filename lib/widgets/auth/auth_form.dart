import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';
import 'package:email_validator/email_validator.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);

  final void Function(
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _userEmail = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_userEmail, _userPassword, context);
    }
  }

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
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) {
                            if (!EmailValidator.validate(value!) ||
                                value.isEmpty) return 'E-mail inválido.';
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.cyan),
                            errorStyle: TextStyle(color: Colors.white),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          style: TextStyle(color: Colors.white),
                          onSaved: (value) {
                            _userEmail = value!;
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6)
                              return 'Senha muito curta.';
                          },
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.cyan),
                            errorStyle: TextStyle(color: Colors.white),
                            errorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          onSaved: (value) {
                            _userPassword = value!;
                          },
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: _trySubmit,
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
