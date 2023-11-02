import 'package:cloud_firestore/cloud_firestore.dart';

class EventData {
  static List<Map<String, dynamic>> events = [];

  static Future<void> loadEvents() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('events').get();
    events = snapshot.docs.map((doc) => doc.data()).toList();
  }
}
