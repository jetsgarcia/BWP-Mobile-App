import 'package:flutter/material.dart';

// import screens
import 'package:bwp/screens/app/user/1home/user_home.dart';
import 'package:bwp/screens/app/user/2about/user_about.dart';
import 'package:bwp/screens/app/user/3events/user_events.dart';
import 'package:bwp/screens/app/user/4resources/user_resources.dart';
import 'package:bwp/screens/app/user/5connect/user_connect.dart';
import 'package:bwp/screens/app/user/6donate/user_donate.dart';
import 'package:bwp/screens/app/user/7settings/user_settings.dart';

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
          _buildDrawerItem(context, Icons.home, 'Home', '/home'),
          _buildDrawerItem(context, Icons.info, 'About', '/about'),
          _buildDrawerItem(context, Icons.event, 'Events', '/events'),
          _buildDrawerItem(
              context, Icons.library_books, 'Resources', '/resources'),
          _buildDrawerItem(context, Icons.people, 'Connect', '/connect'),
          _buildDrawerItem(context, Icons.favorite, 'Donate', '/support'),
          _buildDrawerItem(context, Icons.settings, 'Settings', '/settings'),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(
      BuildContext context, IconData icon, String title, String route) {
    final isActive = route == activeRoute;
    Widget screen;
    switch (route) {
      case '/home':
        screen = const UserHome();
        break;
      case '/about':
        screen = const UserAbout();
        break;
      case '/events':
        screen = const UserEvents();
        break;
      case '/resources':
        screen = const UserResources();
        break;
      case '/connect':
        screen = const UserConnect();
        break;
      case '/support':
        screen = const UserDonate();
        break;
      case '/settings':
        screen = const UserSettings();
        break;
      default:
        screen = const UserHome();
    }
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: isActive ? Colors.white : null),
          const SizedBox(width: 16),
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
        Navigator.of(context).pushReplacement(CustomPageRoute(child: screen));
      },
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
