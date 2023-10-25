import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  const UpcomingEvents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: const SingleEvent(
                      image: 'assets/bamboo_summit.png',
                      title: 'Bamboo Summit',
                      description:
                          'An international gathering celebrating bamboo\'s sustainable potential.')),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                child: const SingleEvent(
                    image: 'assets/bamboo_expo.png',
                    title: 'Bamboo Expo',
                    description:
                        'Highlighting the versatility and sustainability of bamboo through innovative products and art'),
              ),
            ],
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
