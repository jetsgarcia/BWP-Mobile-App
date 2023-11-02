// Import necessary packages and files

import 'package:flutter/material.dart';

class LatestUpdates extends StatelessWidget {
  const LatestUpdates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Column(children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: const Text(
              "Latest Updates",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        const SingleUpdate(
          title: 'Community Garden Event',
          description:
              "Residents come together to create a beautiful community garden.",
          image: 'assets/garden.jpg',
        ),
        const SizedBox(height: 12),
        const SingleUpdate(
          title: 'Clean Energy Initiative',
          description:
              "New solar panels installed in town to reduce energy costs.",
          image: 'assets/clean_energy.jpg',
        ),
        const SizedBox(height: 12),
        const SingleUpdate(
          title: 'Youth Environmental Club',
          description:
              "Local students launch a club to promote eco-friendly practices.",
          image: 'assets/advocacy.jpg',
        ),
        const SizedBox(height: 12),
        const SingleUpdate(
          title: 'River Cleanup Success',
          description:
              "Volunteers clean up the local river, making it safer and cleaner.",
          image: 'assets/river.jpg',
        ),
        const SizedBox(height: 12),
      ]),
    );
  }
}

// Single update widget that is displayed in the latest updates widget
class SingleUpdate extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const SingleUpdate({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(136, 48, 48, 48)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
