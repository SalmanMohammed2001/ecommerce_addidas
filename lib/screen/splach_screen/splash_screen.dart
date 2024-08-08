import 'package:ecommerce_addidas/screen/home_screen/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../utils/CustomNavigator.dart';
import '../auth_screen/signIn_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            Logger().e('User is currently signed out!');
            CustomNavigator.goTo(context, const SignInScreen());
          } else {
            Logger().f('User is signed in!');
            CustomNavigator.goTo(context, const HomeScreen());
          }
        });

        // CustomNavigator.goTo(context, const SignInScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/adidas-logo.png"),
            const CupertinoActivityIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
