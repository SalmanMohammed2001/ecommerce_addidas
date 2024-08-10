import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_addidas/model/user_model.dart';
import 'package:ecommerce_addidas/provider/auth_provider.dart';
import 'package:ecommerce_addidas/screen/home_screen/profile/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../screen/auth_screen/signIn_screen.dart';
import '../screen/home_screen/home_page/home_page.dart';
import '../utils/CustomNavigator.dart';

class AuthController {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> listenAuthState(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().e('User is currently signed out!');
        CustomNavigator.goTo(context, const SignInScreen());
      } else {
        Provider.of<AuthProviders>(context, listen: false).setUser(user);
        Logger().f('User is signed in!');
        fetchUserData(user.uid).then((value) {
          if(value!=null){
            Provider.of<AuthProviders>(context,listen: false).setUserModel(value);
            CustomNavigator.goTo(context, const MainScreen());
          }else{
            Provider.of<AuthProviders>(context,listen: false).setUserModel(UserModel(name: "", image: "", email: user.uid, uid: user.uid));
            CustomNavigator.goTo(context, const HomeScreen());
          }
        },);

      }
    });
  }

  Future<bool> createUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      Logger().f(email);
      Logger().f(password);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        UserModel user = UserModel(
            name: name,
            image: "",
            email: email,
            uid: credential.user!.uid);
        addUserData(user);
      }

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

  Future<void> addUserData(UserModel user) async {
    try {
      await users.doc(user.uid).set(user.toJson());

      Logger().f("User Saved");
    } catch (e) {
      Logger().e(e);
    }
  }

  Future<UserModel?> fetchUserData(String uid)async{
    try{
      DocumentSnapshot snapshot= await users.doc(uid).get();
      return  UserModel.fromJson(snapshot.data() as Map<String,dynamic>);
    }catch(e){
      Logger().e(e);
      return null;
    }

  }
}
