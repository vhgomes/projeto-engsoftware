import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/navbar/professor_drawer.dart';
import 'package:email_validator/email_validator.dart';

class StudentForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();

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
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Confirmando informações'),
                                ),
                              );
                            }
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
