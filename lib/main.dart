// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import route definitions
import 'routes.dart';

// Import screens
import 'about_screen.dart';
import 'connect_screen.dart';
import 'events_screen.dart';
import 'resources_screen.dart';
import 'support_screen.dart';

void main() {
  //This function will run the app
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

  // Function for building the drawer items
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

// Home screen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Home"),
      ),
      drawer: BurgerMenu(activeRoute: '/home'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DailyTrivia(),
            SizedBox(height: 20),
            UpcomingEvents(),
            SizedBox(height: 20),
            LatestUpdates()
          ],
        ),
      ),
    );
  }
}

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

// Daily trivia widget that is displayed at the top of the home screen
class DailyTrivia extends StatelessWidget {
  const DailyTrivia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 16, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Column(
                children: [
                  ListTile(
                    title: Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: const Text(
                        "Trivia of the day",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    subtitle: const Text(
                      "Bamboo is the fastest growing plant on earth. It can grow 3 feet in height in 24 hours under appropriate climate conditions.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: const Text(
                "Events",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 270,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SingleEvent(),
                SingleEvent(),
                SingleEvent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SingleEvent extends StatelessWidget {
  const SingleEvent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      width: 250,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.green),
    );
  }
}

class LatestUpdates extends StatelessWidget {
  const LatestUpdates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: const Text(
                "Latest Updates",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SingleUpdate(),
          const SingleUpdate(),
          const SingleUpdate(),
          const SingleUpdate(),
        ],
      ),
    );
  }
}

class SingleUpdate extends StatelessWidget {
  const SingleUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.green),
    );
  }
}
