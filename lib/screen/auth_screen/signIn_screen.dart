
import 'package:ecommerce_addidas/components/custom_text/custom_text.dart';
import 'package:ecommerce_addidas/provider/signin_provider.dart';
import 'package:ecommerce_addidas/screen/auth_screen/forgot_password.dart';
import 'package:ecommerce_addidas/screen/auth_screen/signup_screen.dart';
import 'package:ecommerce_addidas/screen/home_screen/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/custom_button/custom_button1.dart';
import '../../components/custom_button/google_button.dart';
import '../../components/custom_text_field/custom_text_field1.dart';
import '../../utils/CustomNavigator.dart';




class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Consumer<SignInProvider>(
              builder: (context,value,child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: "Adidas",
                      fontsize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    const CustomText(
                      text: "Please fill Your  details to access your account",
                      fontsize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    CustomTextField1(
                      label: "Email",
                      prefixIcon: Icons.email,
                      controller: value.emailController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField1(
                      label: "Password",
                      prefixIcon: Icons.password,
                      isPassword: true,
                      controller: value.passwordController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        const CustomText(
                          text: "Remember me",
                          fontsize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            CustomNavigator.goTo(context, const ForgotPassword());
                          },
                          child: const CustomText(
                            text: "Forgot Password",
                            fontsize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton1(
                      size: size,
                      text: "Sign In",
                      bgColor: Colors.orange.shade700,
                      onTap: () {
                        value.startSignIn();
                      },
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    GoogleButton(
                      size: size,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                     InkWell(
                       onTap: () {
                         CustomNavigator.goTo(context, const SignUpScreen());
                       },
                       child: Center(
                         child: Text.rich(TextSpan(text: "Don't have an account ? ", children: [
                          TextSpan(
                              text: "SignUp",
                              style: TextStyle(
                                  color: Colors.orange.shade800, fontWeight: FontWeight.bold))
                                       ])),
                       ),
                     )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
