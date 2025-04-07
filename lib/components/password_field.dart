import 'package:flutter/material.dart';

class MyPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyPasswordField({
    super.key,
    required this.controller,
    required this.hintText, 
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.all(8.0),
          hintText: hintText,
          prefixIcon: const Icon(Icons.security, size: 18,),

          hintStyle: TextStyle(
            color: Colors.grey[500],
            ),

          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),

          ),
        ),
      );
    }
}