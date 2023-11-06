import 'package:cloud_firestore/cloud_firestore.dart';

// For querying data fromm firestore
class EventData {
  static List<Map<String, String>> events = [];

  static Future<List<Map<String, String>>> loadEvents() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('events').get();
    events = snapshot.docs.map((doc) {
      // Convert dynamic map to Map<String, String>
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        'Image': data['Image'].toString(),
        'Title': data['Title'].toString(),
        'Description': data['Description'].toString(),
      };
    }).toList();
    return events;
  }
}
