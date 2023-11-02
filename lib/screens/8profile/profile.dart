import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bwp/screens/authenticate/authenticate.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/sofia.jpg'),
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Sofia Reyes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text("A student who loves bamboo crafting arts"),
            const SizedBox(height: 10.0),
            const Divider(indent: 45, endIndent: 45, thickness: 2),
            const SizedBox(height: 40.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: () {
                // Sign out
                AuthManager().signOut();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const Authenticate(),
                ));
              },
              child: const Text('Sign out'),
            ),
            const SizedBox(height: 120.0)
          ],
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
