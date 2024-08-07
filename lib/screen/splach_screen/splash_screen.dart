import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    Future.delayed(Duration(seconds: 3),() {
      CustomNavigator.goTo(context, const SignInScreen());
    },);
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
