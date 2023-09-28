// Import necessary packages and files
import 'package:flutter/material.dart';

// Import route definitions
import 'routes.dart';

// Import screens
import 'about_screen.dart';
import 'connect_screen.dart';
import 'events_screen.dart';
import 'resources_screen.dart';
import 'support_screen.dart';

void main() {
  runApp(const MyApp());
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bamboo Warriors Philippines',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
        // Add more theme settings here if needed
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
      },
    );
  }
}

// Menu widget for appbar
class BurgerMenu extends StatelessWidget {
  final String activeRoute;

  const BurgerMenu({
    super.key,
    required this.activeRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/logo.png'),
            ),
          ),
          _buildDrawerItem(context, 'Home', '/home', const HomeScreen()),
          _buildDrawerItem(context, 'About', '/about', const AboutScreen()),
          _buildDrawerItem(context, 'Events', '/events', const EventsScreen()),
          _buildDrawerItem(
              context, 'Resources', '/resources', const ResourcesScreen()),
          _buildDrawerItem(
              context, 'Connect', '/connect', const ConnectScreen()),
          _buildDrawerItem(
              context, 'Support', '/support', const SupportScreen()),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(
      BuildContext context, String title, String route, Widget screen) {
    final isActive = route == activeRoute;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
      tileColor: isActive ? Colors.green : null,
      onTap: () {
        // Navigate to the selected screen with a custom page transition
        Navigator.of(context).pushReplacement(CustomPageRoute(child: screen));
      },
    );
  }
}

// HomeScreen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const BurgerMenu(activeRoute: '/home'),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Trivia of the day",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Upcoming Events",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 200,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Latest Updates",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 200,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
