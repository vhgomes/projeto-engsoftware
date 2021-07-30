import 'package:flutter/material.dart';
import 'package:project/screens/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/screens/student_form.dart';
import 'package:project/screens/student_grade.dart';
import 'package:project/screens/student_list.dart';
import 'package:project/screens/student_screen.dart';
import 'package:project/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.colorTheme(context),
      initialRoute: '/',
      routes: {
        '/Lista%20Estudante': (context) => StudentList(),
        '/Notas%20Professor': (context) => StudentListGrade(),
        '/Cadastro': (context) => StudentForm(),
        '/Notas%20Aluno': (context) => StudentScreen(),
        '/': (context) => LoginPage(), // TODO: Rota inicial login screen
      },
    );
  }
}
