import 'package:bwp/main.dart';
import 'package:flutter/material.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Connect"),
      ),
      drawer: BurgerMenu(activeRoute: '/connect'),
    );
  }
}
