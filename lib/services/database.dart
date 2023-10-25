import 'package:cloud_firestore/cloud_firestore.dart';

// Create a DatabaseManager class to manage Firestore interactions.
class DatabaseManager {
  // Reference to the 'events' collection in Firestore.
  final CollectionReference eventsCollection =
      FirebaseFirestore.instance.collection('events');

  // Method to get a real-time stream of data from the 'events' collection.
  Stream<QuerySnapshot> getEventsStream() {
    // Return a stream of query snapshots from the 'eventsCollection'.
    // This stream will provide real-time updates when data changes in the 'events' collection.
    return eventsCollection.snapshots();
  }
}
