import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_core/pages/home_page.dart';
import 'package:student_core/pages/login_page.dart';

class AuthPage extends StatelessWidget {
const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for the authentication state
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData && snapshot.data != null) {
          // User is authenticated, navigate to HomePage
          return HomePage();
        } else {
          // User is not authenticated, show LoginPage
          return LoginPage();
        }
      },
    );
  }
}
