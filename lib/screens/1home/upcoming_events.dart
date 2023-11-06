import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventData {
  static List<Map<String, String>> events = [];

  static Future<List<Map<String, String>>> loadEvents() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('events').get();
    events = snapshot.docs.map((doc) {
      final dynamic data = doc.data();
      return {
        'Image': data['Image'].toString(),
        'Title': data['Title'].toString(),
        'Description': data['Description'].toString(),
      };
    }).toList();
    return events;
  }
}

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, String>>>(
      future: EventData.loadEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error fetching data'),
          );
        } else if (snapshot.data == null || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No upcoming events available'),
          );
        } else {
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: const Text(
                      "Upcoming Events",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 270,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (final event in snapshot.data!)
                        SingleEvent(
                          image: event['Image'] ?? '',
                          title: event['Title'] ?? '',
                          description: event['Description'] ?? '',
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

// Single event widget that is displayed in the upcoming events widget
class SingleEvent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const SingleEvent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            child: Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(136, 48, 48, 48),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
