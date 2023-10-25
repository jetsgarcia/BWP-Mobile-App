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
      child: Column(
        children: [
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
          const SingleUpdate(),
          const SingleUpdate(),
          const SingleUpdate(),
          const SingleUpdate(),
        ],
      ),
    );
  }
}

// Single update widget that is displayed in the latest updates widget
class SingleUpdate extends StatelessWidget {
  const SingleUpdate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.green),
    );
  }
}
