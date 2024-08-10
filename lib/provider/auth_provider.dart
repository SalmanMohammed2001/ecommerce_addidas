import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../controller/auth_controller.dart';

class AuthProviders extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
