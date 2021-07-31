import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/widgets/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _submitLoginForm(
    String email,
    String password,
    BuildContext ctx,
  ) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      var message = '';

      if (error.code == 'user-not-found') {
        message = 'Nenhum usuário encontrado para este e-mail.';
      } else if (error.code == 'wrong-password') {
        message = 'Senha incorreta.';
      }

      Scaffold.of(ctx).showBottomSheet(
        (context) => Text(message),
        backgroundColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(_submitLoginForm),
    );
  }
}
