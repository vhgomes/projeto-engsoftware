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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: drawerBGClor,
      ),
      drawer: ProfessorDrawer(),
      body: SingUpForm(),
    );
  }
}
