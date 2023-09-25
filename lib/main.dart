import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bamboo Warriors Philippines',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/events': (context) => const EventsScreen(),
        '/resources': (context) => const ResourcesScreen(),
        '/connect': (context) => const ConnectScreen(),
        '/support': (context) => const SupportScreen(),
      },
    );
  }
}

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
            child: Text('Logo'),
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
        Navigator.of(context).pushReplacement(CustomPageRoute(child: screen));
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        //add color to the background
        backgroundColor: Colors.green,
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

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      drawer: const BurgerMenu(activeRoute: '/about'),
    );
  }
}

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        drawer: const BurgerMenu(activeRoute: '/events'));
  }
}

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resources'),
        ),
        drawer: const BurgerMenu(activeRoute: '/resources'));
  }
}

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connect'),
        ),
        drawer: const BurgerMenu(activeRoute: '/connect'));
  }
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Support'),
        ),
        drawer: const BurgerMenu(activeRoute: '/support'));
  }
}
