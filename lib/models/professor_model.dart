import 'package:project/models/user.dart';

class Professor extends User {
  Professor(User user)
      : super(
          uniqueID: user.uniqueID,
          name: user.name,
          email: user.email,
          senha: user.senha,
          isStudent: user.isStudent,
        );
}
