
import 'package:ecommerce_addidas/screen/auth_screen/signIn_screen.dart';
import 'package:flutter/material.dart';



import '../../components/custom_button/custom_button1.dart';
import '../../components/custom_button/google_button.dart';

import '../../components/custom_text/custom_text.dart';
import '../../components/custom_text_field/custom_text_field1.dart';
import '../../utils/CustomNavigator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: "Adidas",
                  fontsize: 28,
                  fontWeight: FontWeight.w600,
                ),
                const CustomText(
                  text: "create New  Account With Your Email and Password",
                  fontsize: 15,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomTextField1(
                  label: "Email",
                  prefixIcon: Icons.email,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField1(
                  label: "Password",
                  prefixIcon: Icons.password,
                  isPassword: true,
                  controller: passwordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField1(
                  label: "confirm Password",
                  prefixIcon: Icons.password,
                  isPassword: true,
                  controller: confirmPasswordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton1(
                  size: size,
                  text: "Sign Up",
                  bgColor: Colors.orange.shade700,
                  onTap: () {
                    if (emailController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty ||
                        passwordController.text !=
                            confirmPasswordController.text) {
                      //Logger().f("INVALIDATE DATA");
                    }else{

                    }

                  },
                ),
                const SizedBox(
                  height: 6,
                ),
                GoogleButton(
                  size: size,
                  isSignIn: false,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    CustomNavigator.goTo(context, const SignInScreen());
                  },
                  child: Center(
                    child: Text.rich(
                        TextSpan(text: "Already Have an Account ? ", children: [
                      TextSpan(
                          text: "Sign In",
                          style: TextStyle(
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.bold))
                    ])),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
