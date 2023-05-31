import 'package:firebase_auth/firebase_auth.dart';
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