
import 'package:flutter/material.dart';


import '../custom_text/custom_text.dart';



class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.size,
    required this.text,
    required this.bgColor,
    required this.onTap,

  });

  final Size size;
  final String text;
  final Color bgColor;
  final VoidCallback  onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: size.width * 0.7,
          height: 45,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child:  Center(
              child: CustomText(
                text: text,
                color: Colors.white,
                fontsize: 15,
              )),
        ),
      ),
    );
  }
}
