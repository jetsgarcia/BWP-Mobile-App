import 'package:bwp/screens/widgets/universal_widgets.dart';
import 'package:flutter/material.dart';

class UserConnect extends StatelessWidget {
  const UserConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Connect"),
      ),
      drawer: const BurgerMenu(activeRoute: '/connect'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16),
            const Center(
              child: Text("Members:", style: TextStyle(fontSize: 16)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: const Row(
                children: <Widget>[
                  Expanded(
                    child:
                        Profile(name: 'Alice', imagePath: 'assets/alice.jpg'),
                  ),
                  Expanded(
                    child: Profile(name: 'Bob', imagePath: 'assets/bob.jpg'),
                  ),
                ],
              ),
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child:
                      Profile(name: 'Charlie', imagePath: 'assets/charlie.jpg'),
                ),
                Expanded(
                  child: Profile(name: 'David', imagePath: 'assets/david.jpg'),
                ),
              ],
            ),
            const Row(
              children: <Widget>[
                Expanded(
                  child:
                      Profile(name: 'Olivia', imagePath: 'assets/olivia.jpg'),
                ),
                Expanded(
                  child: Profile(name: 'Noah', imagePath: 'assets/noah.jpg'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  final String name;
  final String? imagePath;

  const Profile({
    Key? key,
    required this.name,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: imagePath != null
                  ? DecorationImage(
                      image: AssetImage(imagePath!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
