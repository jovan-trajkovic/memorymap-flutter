import 'package:flutter/material.dart';

import '../objects/location_log.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<LocationLog> logs = [
      LocationLog(
        logName: "Beach Trip",
        description: "Visited the beach.",
        addDate: DateTime(2024, 3, 18),
        rating: 2.0,
      ),
      LocationLog(
        logName: "Mountain Hike",
        description: "Hiked up the hill.",
        addDate: DateTime(2024, 3, 10),
        rating: 3.5,
      ),
      LocationLog(
        logName: "City Walk",
        description: "Explored downtown.",
        addDate: DateTime(2024, 2, 25),
        rating: 10.0,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'List of logs',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index];
                  return ListTile(
                    leading: Image.asset('assets/placeholder.jpg',),
                    title: Text(log.logName),
                    subtitle: Text("${log.description}\nRating: ${log.rating}"),
                    trailing: Text(
                      "${log.addDate.day}/${log.addDate.month}/${log.addDate.year}",
                    ),
                    onTap:
                        () {}, //todo: implement on tap navigation to log details
                    onLongPress: () {}, //todo: implement delete log on hold
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
