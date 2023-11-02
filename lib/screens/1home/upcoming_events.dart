import 'package:flutter/material.dart';
import 'package:bwp/screens/widgets/events_data.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = EventData.events;

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
        Visibility(
          visible:
              events.isEmpty, // Show loading indicator when events are empty
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Visibility(
          visible: events.isNotEmpty, // Show events when they are available
          child: SizedBox(
            height: 270,
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final event in events)
                    SingleEvent(
                      image: event[
                          'Image'], // Replace 'image' with your actual field name
                      title: event[
                          'Title'], // Replace 'title' with your actual field name
                      description: event[
                          'Description'], // Replace 'description' with your actual field name
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
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
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(description,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(136, 48, 48, 48))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
