import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:bwp/screens/wrapper.dart';

void main() async {
  // This function is the entry point of the app
  // It ensures that Firebase is initialized before the app is run
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  // Initialize the app
  runApp(const Root());
  // Set the status bar color to black
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
}

// Root widget that is the parent of all other widgets
class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'Bamboo Warriors Philippines',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor:
              Colors.green, // Set the app bar color to green for all screens
        ),
      ),
      home:
          const Wrapper(), // Wrapper widget that determines which screen to display
    );
  }
}
