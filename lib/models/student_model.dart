import 'package:project/models/user.dart';

class Student extends User {
  final double nota1;
  final double nota2;

  Student(
    User user, {
    required this.nota1,
    required this.nota2,
  }) : super(
          email: user.email,
          uniqueID: user.uniqueID,
          isStudent: user.isStudent,
          name: user.name,
          senha: user.senha,
        );
}
