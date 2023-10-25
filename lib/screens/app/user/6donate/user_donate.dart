import 'package:flutter/material.dart';

// Import widgets
import 'package:bwp/screens/app/user/universal_widgets.dart';

class UserDonate extends StatelessWidget {
  const UserDonate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Donate"),
      ),
      drawer: BurgerMenu(activeRoute: '/support'),
    );
  }
}
