import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double width; // Add a width parameter
  const SignInButton({
    super.key, 
    required this.onTap,
    required this.text,
    this.width = double.infinity, // Set default width to match parent width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox( // Use SizedBox to set the width
      width: width,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 147, 148, 148),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
