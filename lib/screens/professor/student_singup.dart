import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/navbar/professor_drawer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentSignUp extends StatefulWidget {
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  _StudentSignUpState createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();

  var _name = '';
  var _email = '';
  var _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
      ),
      drawer: ProfessorDrawer(),
      body: Container(
        decoration: AppTheme.backgroudTheme(),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: EdgeInsets.all(25),
              width: 550,
              height: 550,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      style: TextStyle(color: Color(0xFFF2EDDC)),
                      decoration: const InputDecoration(
                        fillColor: Color(0x88111026),
                        filled: true,
                        hintText: 'Nome Completo',
                        hintStyle: TextStyle(color: Color(0xFFF2EDDC)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Campo obrigatório.';
                      },
                      onSaved: (value) {
                        _name = value!;
                      },
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(color: Color(0xFFF2EDDC)),
                      decoration: const InputDecoration(
                        fillColor: Color(0x88111026),
                        filled: true,
                        hintText: 'E-mail',
                        hintStyle: TextStyle(color: Color(0xFFF2EDDC)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (!EmailValidator.validate(value!) || value.isEmpty)
                          return 'E-mail inválido.';
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _password,
                      style: TextStyle(color: Color(0xFFF2EDDC)),
                      decoration: const InputDecoration(
                        fillColor: Color(0x88111026),
                        filled: true,
                        hintText: 'Senha',
                        hintStyle: TextStyle(color: Color(0xFFF2EDDC)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 6)
                          return 'Senha muito curta.';
                      },
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      style: TextStyle(color: Color(0xFFF2EDDC)),
                      decoration: const InputDecoration(
                        fillColor: Color(0x88111026),
                        filled: true,
                        hintText: 'Confirmar Senha',
                        hintStyle: TextStyle(color: Color(0xFFF2EDDC)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty)
                          return 'Campo obrigatório';
                        else if (value != _password.text) {
                          return 'Senha incorreta.';
                        }
                      },
                      onSaved: (value) {
                        _confirmPassword = value!;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 36.0),
                      child: SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            alignment: Alignment.center,
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xC5111026)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Aluno cadastrado com sucesso!',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              );
                            }

                            FirebaseFirestore.instance
                                .collection('user/XCXcmzFQIcWptPsjgwRR/student')
                                .add({
                              'name': _name,
                              'email': _email,
                              'password': _confirmPassword,
                            });
                          },
                          child: Text('Confimar'),
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
    );
  }
}
