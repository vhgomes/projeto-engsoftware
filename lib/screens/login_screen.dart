import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/widgets/auth/auth_form.dart';

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
      var userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      var professor = await FirebaseFirestore.instance
          .collection('professor')
          .doc(userCredential.user!.uid)
          .get();

      Navigator.of(context).pushNamed(
          professor.exists ? '/Lista%20Estudante' : '/Notas%20Aluno');
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
      body: AuthForm(_submitLoginForm),
    );
  }
}
