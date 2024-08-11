
import 'package:flutter/material.dart';

class CustomTextField1 extends StatefulWidget {
  const CustomTextField1({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.isPassword=false,
    required this.controller,
    this.keyboardType=TextInputType.text
  });

  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final TextEditingController   controller;
  final TextInputType  keyboardType;

  @override
  State<CustomTextField1> createState() => _CustomTextField1State();
}

class _CustomTextField1State extends State<CustomTextField1> {
  bool isObscure=false;


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:widget.keyboardType,
        controller: widget.controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          label: Text(widget.label),
          border: const OutlineInputBorder(),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.isPassword ? InkWell(
              onTap: () {
                setState(() {
                  isObscure=!isObscure;
                });
              },
              child:  Icon(isObscure ? Icons.visibility : Icons.visibility_off)) : null,

        ));
  }
}
