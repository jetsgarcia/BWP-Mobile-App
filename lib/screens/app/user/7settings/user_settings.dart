import 'package:bwp/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import widgets
import 'package:bwp/screens/app/user/universal_widgets.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Settings"),
      ),
      drawer: const BurgerMenu(activeRoute: '/settings'),
      body: Center(
        // create a sign out button
        child: ElevatedButton(
          onPressed: () {
            AuthManager().signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const Authenticate(),
            ));
          },
          child: const Text('Sign out'),
        ),
      ),
    );
  }
}

class AuthManager {
  // Sign out
  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      print('Error signing out: $e');
    }
  }
}
