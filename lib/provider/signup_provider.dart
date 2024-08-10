import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../controller/auth_controller.dart';

class SignupProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  TextEditingController get userNameController => _userNameController;

  Future<void> startSignUp() async {
    if (_emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _userNameController.text.trim().isEmpty ||
        _passwordController.text != _confirmPasswordController.text) {
      Logger().f("INVALIDATE DATA");
    } else {
      authController
          .createUser(
              email: _emailController.text, password: _passwordController.text,name: _userNameController.text)
          .then(
        (value) {
          if (value) {
            clearTextField();
          }
        },
      );
    }
  }

  void clearTextField() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _userNameController.clear();
    notifyListeners();
  }
}
