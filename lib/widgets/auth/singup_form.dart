import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project/theme/app_theme.dart';

class SingUpForm extends StatefulWidget {
  SingUpForm(this.submitFn);

  final void Function(
    String name,
    String email,
    String password,
    BuildContext ctx,
  ) submitFn;

  @override
  _SingUpFormState createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _password = TextEditingController();

  var _studentName = '';
  var _studentEmail = '';
  var _studentPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(_studentName, _studentEmail, _studentPassword, context);

      /*ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Aluno cadastrado com sucesso!',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
      );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      _studentName = value!;
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
                      _studentEmail = value!;
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
                      _studentPassword = value!;
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                        onPressed: _trySubmit,
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
    );
  }
}
