import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class UserNotification extends StatefulWidget {
  const UserNotification({Key? key}) : super(key: key);

  @override
  State<UserNotification> createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  String _notificationTitle = "No Title";
  String _notificationBody = "No Body";

  late final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    _configureFirebaseMessaging();
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: false,
    );
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    try {
      _handleMessage(message);
    } catch (e) {
      print("Error handling background message: $e");
    }
  }

  void _configureFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      try {
        _handleMessage(message);
      } catch (e) {
        print("Error handling message: $e");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      try {
        _handleMessage(message);
      } catch (e) {
        print("Error handling message opened app: $e");
      }
    });
  }

  void _handleMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      final title = notification.title;
      final body = notification.body;

      if (title != null && body != null) {
        setState(() {
          _notificationTitle = title;
          _notificationBody = body;
        });
      } else {
        setState(() {
          _notificationTitle = title ?? "No Title";
          _notificationBody = body ?? "No Body";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          if (_notificationTitle == "No Title" &&
              _notificationBody == "No Body")
            const Center(
              child: Column(
                children: [
                  SizedBox(height: 300),
                  Text(
                    "No new notifications",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          else
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _notificationTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _notificationBody,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
