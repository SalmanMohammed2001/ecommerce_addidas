import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../screen/auth_screen/signIn_screen.dart';
import '../screen/home_screen/home_page/home_page.dart';
import '../utils/CustomNavigator.dart';

class AuthController {
  CollectionReference users=FirebaseFirestore.instance.collection("users");





  Future<void> listenAuthState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().e('User is currently signed out!');
        CustomNavigator.goTo(context, const SignInScreen());
      } else {
        Provider.of<AuthProviders>(context, listen: false).setUser(user);
        Logger().f('User is signed in!');
        CustomNavigator.goTo(context, const HomeScreen());
      }
    });
  }

  Future<bool> createUser(
      {required String email, required String password}) async {
    try {
      Logger().f(email);
      Logger().f(password);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().f('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().f('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      Logger().f(e);
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> signWithPassword(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      }
      return false;
    } catch (e) {
      Logger().f(e);
      return false;
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> addUserData(User user)async {
    users.doc(user.uid).set({
      "uid":user.uid,
    });
  }
}
