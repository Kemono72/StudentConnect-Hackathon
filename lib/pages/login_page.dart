import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_core/components/text_field.dart';
import 'package:student_core/components/password_field.dart';
import 'package:student_core/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );
      // Navigate to the home page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      // Handle sign-in errors here
      print('Sign-in failed: $e');
      // You can also show a snackbar or dialog to display the error message
    }
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 236, 236),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'lib/Images/3.png',
                  height: 200,
                  width: 200,
                ),
                const Text(
                  "StudentCore",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                    height: -1.2,
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: MyEmailField(
                    controller: emailTextController,
                    hintText: 'name@example.com',
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 9),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: MyPasswordField(
                    controller: passwordTextController,
                    hintText: 'password',
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: signIn,
                    child: const Text('Sign In'),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage("lib/Images/7.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
