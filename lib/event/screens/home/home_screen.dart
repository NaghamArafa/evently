import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Welcome Back, John Safwat"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("EN"),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Cairo, Egypt",
                style: TextStyle(fontSize: 16, color: Colors.grey[700])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterChip(label: Text("All"), onSelected: (val) {}),
                FilterChip(label: Text("Sport"), onSelected: (val) {}),
                FilterChip(label: Text("Birthday"), onSelected: (val) {}),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                EventCard(
                    date: "21 Nov",
                    title: "Birthday",
                    description: "This is a Birthday Party"),
                EventCard(
                    date: "22 Nov",
                    title: "Meeting",
                    description: "Meeting for Updating The Development Method"),
                EventCard(
                    date: "22 Nov",
                    title: "Exhibition",
                    description: "An Art Exhibition Event"),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Love"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String date;
  final String title;
  final String description;

  const EventCard(
      {required this.date, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(description, style: TextStyle(color: Colors.grey[600])),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
