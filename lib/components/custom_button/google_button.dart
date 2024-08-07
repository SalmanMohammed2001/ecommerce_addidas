
import 'package:flutter/material.dart';

import '../custom_text/custom_text.dart';




class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.size,
    required this.onTap,
    this.isSignIn=true
  });

  final Size size;
  final VoidCallback onTap;
  final bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          width: size.width * 0.7,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/google.png",width: 50,height: 50,fit: BoxFit.fitHeight,),
               CustomText(
                text: isSignIn ? "Sign In with Google":"Sign Up with Google",
                fontsize: 14,
                fontWeight: FontWeight.w300,
              ),



            ],
          ),
        ),
      ),
    );
  }
}
