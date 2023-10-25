import 'package:bwp/screens/app/inner_wrapper.dart';
import 'package:bwp/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting) {
          // While the user's authentication state is being determined, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        } else if (userSnapshot.hasData) {
          // If the user is authenticated, show the authenticated content.
          return const InnerWrapper();
        } else {
          // If the user is not authenticated, show the authentication screen.
          return const Authenticate();
        }
      },
    );
  }
}
