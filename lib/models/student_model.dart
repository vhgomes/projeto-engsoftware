import 'package:project/models/user.dart';

class Student extends User {
  final double nota1;
  final double nota2;

  Student(
    User user, {
    required this.nota1,
    required this.nota2,
  }) : super(
          uniqueID: user.uniqueID,
          name: user.name,
          email: user.email,
          password: user.password,
          isStudent: user.isStudent,
        );
}
