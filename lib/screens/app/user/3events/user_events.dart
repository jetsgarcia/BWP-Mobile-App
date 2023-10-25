import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Import widgets
import 'package:bwp/screens/app/user/universal_widgets.dart';

class UserEvents extends StatefulWidget {
  const UserEvents({Key? key}) : super(key: key);

  @override
  State<UserEvents> createState() => _UserEventsState();
}

class _UserEventsState extends State<UserEvents> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Events"),
      ),
      drawer: BurgerMenu(activeRoute: '/events'),
      body: EventList(),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('events').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final events = snapshot.data!.docs;

        if (events.isEmpty) {
          return const Center(
            child: Text("No events available."),
          );
        }

        return ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index].data() as Map<String, dynamic>;
            return EventCard(
              title: event['Title'] ?? 'No Title',
              description: event['Description'] ?? 'No Description',
            );
          },
        );
      },
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String description;

  const EventCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
