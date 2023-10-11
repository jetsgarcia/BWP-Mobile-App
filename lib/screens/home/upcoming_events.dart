// Import necessary packages and files

import 'package:flutter/material.dart';

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

// Single event widget that is displayed in the upcoming events widget
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
