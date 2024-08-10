import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../controller/auth_controller.dart';

class SignInProvider extends ChangeNotifier {
  AuthController authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _resetEmailController = TextEditingController();


  TextEditingController get emailController => _emailController;

  TextEditingController get passwordController => _passwordController;
  TextEditingController get resetEmailController => _resetEmailController;

  void startSignIn() async{
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Logger().f("Invalid data");
    } else {
     bool isSuccess =await authController.signWithPassword(
          email: _emailController.text, password: _passwordController.text);

     if(isSuccess){
       clearTextField();
     }
    }
  }
  void clearTextField(){
    _emailController.clear();
    _passwordController.clear();
    notifyListeners();
  }

  Future<void> sendResetEmail() async{
    if(_resetEmailController.text.trim().isEmpty){
      Logger().f("Please enter email");
    }else{
      authController.sendPasswordResetEmail(_resetEmailController.text);
      Logger().f("Check Your Emails");

    }


  }

}
