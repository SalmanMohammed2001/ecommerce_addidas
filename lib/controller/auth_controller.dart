import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthController {
 Future<void> createUser(
      {required String email, required String password}) async {
    try {
      Logger().f(email);
      Logger().f(password);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().f('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().f('The account already exists for that email.');
      }
    } catch (e) {
      Logger().f(e);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
