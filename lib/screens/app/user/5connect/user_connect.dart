import 'package:flutter/material.dart';

// Import widgets
import 'package:bwp/screens/app/user/universal_widgets.dart';

class UserConnect extends StatelessWidget {
  const UserConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(title: const Text("Connect")),
      ),
      drawer: const BurgerMenu(activeRoute: '/connect'),
      body: ListView(
        children: const <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(child: GreenBox()),
              Expanded(child: GreenBox()),
            ],
          ),
        ],
      ),
    );
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.green,
      margin: const EdgeInsets.all(8.0),
    );
  }
}
