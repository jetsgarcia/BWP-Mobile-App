// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Import route definitions
import 'routes.dart';

// Import screens
import 'package:bwp/screens/about/about_screen.dart';
import 'package:bwp/screens/connect/connect_screen.dart';
import 'package:bwp/screens/events/events_screen.dart';
import 'package:bwp/screens/resources/resources_screen.dart';
import 'package:bwp/screens/support/support_screen.dart';
import 'package:bwp/screens/settings/settings_screen.dart';

import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
}

// CustomPageRoute for transition animation
class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  CustomPageRoute({required this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            var opacityAnimation =
                Tween<double>(begin: 0.0, end: 1.0).animate(animation);

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
        );
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bamboo Warriors Philippines',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green), // Makes all appbars green
      ),
      home: const HomeScreen(),
      routes: {
        // Define app routes and associate them with screen widgets
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.about: (context) => const AboutScreen(),
        AppRoutes.events: (context) => const EventsScreen(),
        AppRoutes.resources: (context) => const ResourcesScreen(),
        AppRoutes.connect: (context) => const ConnectScreen(),
        AppRoutes.support: (context) => const SupportScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
    );
  }
}

// Menu widget for appbar
class BurgerMenu extends StatelessWidget {
  final String activeRoute;

  const BurgerMenu({
    Key? key,
    required this.activeRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            accountName: const Text(
              "Sofia Reyes",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            accountEmail: const Text("sofiar@gmail.com",
                style: TextStyle(fontSize: 14, color: Colors.green)),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
              ),
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/R.ee2077d0513e638c04dfa77bf6f64263?rik=07q%2f6%2bO5ZE0vPg&riu=http%3a%2f%2fwww.world104.com%2fblog%2ftokyoinsider%2fwp-content%2fuploads%2f2011%2f06%2f0045-e0ddc2de.jpg&ehk=kcH%2bIAwbRx5Pz961%2fumkUP3tPdIeBf%2bpfaCEOWP7AxQ%3d&risl=&pid=ImgRaw&r=0'),
              ),
            ),
          ),
          _buildDrawerItem(
              context, Icons.home, 'Home', '/home', const HomeScreen()),
          _buildDrawerItem(
              context, Icons.info, 'About', '/about', const AboutScreen()),
          _buildDrawerItem(
              context, Icons.event, 'Events', '/events', const EventsScreen()),
          _buildDrawerItem(context, Icons.library_books, 'Resources',
              '/resources', const ResourcesScreen()),
          _buildDrawerItem(context, Icons.people, 'Connect', '/connect',
              const ConnectScreen()),
          _buildDrawerItem(context, Icons.favorite, 'Support', '/support',
              const SupportScreen()),
          _buildDrawerItem(context, Icons.settings, 'Settings', '/settings',
              const SettingsScreen()),
        ],
      ),
    );
  }

  // Function for building the drawer items with icons
  ListTile _buildDrawerItem(BuildContext context, IconData icon, String title,
      String route, Widget screen) {
    final isActive = route == activeRoute;
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: isActive ? Colors.white : null),
          const SizedBox(width: 16), // Adjust this value to control the spacing
          Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      tileColor: isActive ? Colors.green : null,
      onTap: () {
        // Navigate to the selected screen with a custom page transition
        Navigator.of(context).pushReplacement(CustomPageRoute(child: screen));
      },
    );
  }
}

// Custom appbar widget
class AppTopBar extends StatelessWidget {
  final String title;

  const AppTopBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      ],
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
