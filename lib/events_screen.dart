import 'package:bwp/main.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Events',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const BurgerMenu(activeRoute: '/events'),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: TableCalendar(
            locale: "en_US",
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2010),
            lastDay: DateTime.utc(2030),
          ),
        ),
      ]),
    );
  }
}
