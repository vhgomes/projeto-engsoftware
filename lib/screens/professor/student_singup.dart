import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/theme/navbar_theme.dart';
import 'package:project/widgets/auth/singup_form.dart';
import 'package:project/widgets/navbar/professor_drawer.dart';

class StudentSignUp extends StatefulWidget {
  const StudentSignUp({Key? key}) : super(key: key);

  @override
  _StudentSignUpState createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  void _submitAuthForm(
    String name,
    String email,
    String password,
    BuildContext ctx,
  ) async {
    UserCredential userCredential;
    var message = '';

    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('student')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
      });

      message = 'Aluno cadastrado com sucesso!';
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {
        message = 'E-mail já cadastrado.';
      } else if (error.code == 'weak-password') {
        message = 'Senha muito curta.';
      }
    }

    Scaffold.of(ctx).showBottomSheet(
      (context) => Text(message),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: ProfessorDrawer(),
      body: SingUpForm(_submitAuthForm),
    );
  }
}
