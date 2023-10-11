import 'package:bwp/main.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  // Default selected category
  String selectedCategory = "Today";

  // Function to update the selected category
  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // List of available categories
  List<String> categories = ["Past", "Today", "Upcoming"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppTopBar(title: "Events"),
      ),
      // Drawer menu
      drawer: const BurgerMenu(activeRoute: '/events'),
      body: Column(
        children: [
          // Category selection buttons
          Container(
            margin: const EdgeInsets.fromLTRB(12, 16, 12, 0),
            child: Row(
              children: categories.map((category) {
                return Expanded(
                  child: ElevatedButton(
                    onPressed: () => selectCategory(category),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        selectedCategory == category
                            ? Colors.green
                            : Colors.white,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category
                            ? Colors.white
                            : Colors.green,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Containers for displaying events based on the selected category
          if (selectedCategory == "Past")
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                title: Text("Past Event 1"),
                subtitle: Text("Event description goes here."),
              ),
            ),
          if (selectedCategory == "Today")
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                title: Text("Today Event 1"),
                subtitle: Text("Event description goes here."),
              ),
            ),
          if (selectedCategory == "Upcoming")
            Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const ListTile(
                title: Text("Upcoming Event 1"),
                subtitle: Text("Event description goes here."),
              ),
            ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: EventsScreen(),
  ));
}
