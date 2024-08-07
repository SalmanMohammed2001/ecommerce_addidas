import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.fontsize = 20,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
          fontSize: fontsize, fontWeight: fontWeight, color: color),
    );
  }
}
