import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String email = "";
  String password = "";
  String error = "";
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  Color emailBorderColor = Colors.green;
  Color passwordBorderColor = Colors.green;
  Color emailDefault = Colors.grey;
  Color passDefault = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo displayed at the top
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 64),
            // =================================================================
            // Email Text Field
            SizedBox(
              width: 300,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value; // Update email variable
                    emailBorderColor = Colors.green; // Change border color
                    emailDefault = Colors.grey; // Reset border color
                    error = ""; // Clear error message when user starts typing
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: emailDefault,
                    ),
                  ),
                  hintText: 'Email',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: emailBorderColor,
                    ),
                  ),
                ),
                focusNode: emailFocus,
              ),
            ),
            const SizedBox(height: 16),
            // =================================================================
            // Password Text Field
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value; // Update password variable
                    passwordBorderColor = Colors.green; // Change border color
                    passDefault = Colors.grey; // Reset border color
                    error = ""; // Clear error message
                  });
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: passDefault,
                    ),
                  ),
                  hintText: 'Password',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: passwordBorderColor,
                    ),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16),
            // =================================================================
            // Show error text only when there's an error
            if (error.isNotEmpty)
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
            // Sign-in Button
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  emailFocus.unfocus();
                  passwordFocus.unfocus();
                  _signIn();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const Text('Sign in'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle user sign-in
  Future<void> _signIn() async {
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        // Validate and update field borders and error message
        if (email == "") {
          emailDefault = Colors.red;
        } else {
          emailBorderColor = Colors.green;
        }
        if (password == "") {
          passDefault = Colors.red;
        } else {
          passwordBorderColor = Colors.green;
        }
        error = "Please fill in all fields.";
      });
      return;
    }

    try {
      // Continue signing in with email and password
      await signInWithEmailAndPassword(email, password);
    } catch (e) {
      // Handle Firebase Authentication exceptions
      if (e is FirebaseAuthException) {
        setState(() {
          print(e.message);
          if (e.message!.contains("email address")) {
            error = "Email address not found";
          } else if (e.message!.contains("internal")) {
            error = "Incorrect password";
          } else {
            error = "Authentication Error";
          }
        });
      } else {
        setState(() {
          error = "General Error: $e";
        });
      }
    }
  }

  // Sign in with email and password directly using Firebase Authentication
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
