// Import necessary packages and files

import 'package:bwp/main.dart';
import 'package:flutter/material.dart';

import 'daily_trivia.dart';
import 'latest_updates.dart';
import 'upcoming_events.dart';

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
