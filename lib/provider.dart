import 'package:flutter/widgets.dart';
import 'package:mini_project/services/auth_services.dart';

import 'package:mini_project/usermodel/modle.dart';

class UserProvider with ChangeNotifier {
  Staff? _user;
  final AuthServices _authMethods = AuthServices();

  Staff get getUser => _user!;

  Future<void> refreshUser() async {
    Staff user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}

class StudentProvider with ChangeNotifier {
  Student? _user;
  final AuthServices _authMethods = AuthServices();

  Student get getUser => _user!;

  Future<void> refreshUser() async {
    Student user = (await _authMethods.getUserDetails()) as Student;
    _user = user;
    notifyListeners();
  }
}
