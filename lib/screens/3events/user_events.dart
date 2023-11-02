import 'package:flutter/material.dart';
import 'package:bwp/screens/widgets/events_data.dart';
import 'package:bwp/screens/widgets/universal_widgets.dart';

class UserEvents extends StatefulWidget {
  const UserEvents({Key? key}) : super(key: key);

  @override
  State<UserEvents> createState() => _UserEventsState();
}

class _UserEventsState extends State<UserEvents> {
  @override
  void initState() {
    super.initState();
    EventData.loadEvents();
  }

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
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = EventData.events;

    return events.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventCard(
                title: event['Title'] ?? 'No Title',
                description: event['Description'] ?? 'No Description',
                image: event['Image'] ?? 'No Image',
                location: event['Location'] ?? 'No Location',
              );
            },
          );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String location;

  const EventCard({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: ListTile(
              title: Text(title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description),
                  const SizedBox(height: 8),
                  Text(
                    "Location: $location",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(136, 48, 48, 48),
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
