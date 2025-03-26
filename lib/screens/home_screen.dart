import 'package:flutter/material.dart';
import 'package:memory_map/database/memory_map_database.dart';
import 'package:memory_map/log_provider.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as drift;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override void initState() {
    super.initState();
    Future.microtask(() {
      final logProvider = Provider.of<LogProvider>(context, listen: false);
      logProvider.addLog(LocationLogCompanion(
        logName: drift.Value("Beach Trip"),
        description: drift.Value("Visited the beach."),
        addDate: drift.Value(DateTime(2024, 3, 18)),
        rating: drift.Value(2.0),
        latitude: drift.Value(0.0),
        longitude: drift.Value(0.0),
        thumbnailPath: drift.Value(''),
      ));
      //logProvider.loadLogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    //final logProvider = Provider.of<LogProvider>(context, listen: false);
    //not needed anymore, since Consumer provides it.
    /*'listen: false' means this widget will not rebuild when notifyListeners()
    * is called in LogProvider. The UI will still get updated because the
    * FutureBuilder makes a Future call (calls an async function) and
    * updates when the future is complete. That is why the UI gets updated.
    * The UI will not get updated from other futures called inside of it.
    *
    * Update - changed the FutureBuilder to Consumer, Consumer tracks changes
    * in the provider and updates the UI inside it when the changes occur.
    * (When notifyListeners() is called)
    */

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
              child: Consumer<LogProvider>(
                builder: (context, logProvider, child) {
                  if (logProvider.logs.isEmpty) {
                    return Center(child: Text("No logs yet."));
                  }

                  return ListView.builder(
                    itemCount: logProvider.logs.length,
                    itemBuilder: (context, index) {
                      final log = logProvider.logs[index];
                      return ListTile(
                        leading: Image.asset('assets/placeholder.jpg'),
                        title: Text(log.logName),
                        subtitle: Text(
                          "${log.description}\nRating: ${log.rating}",
                        ),
                        trailing: Text(
                          "${log.addDate.day}/${log.addDate.month}/${log.addDate.year}",
                        ),
                        onTap:
                            () {}, //todo: implement on tap navigation to log details
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete Log'),
                                content: const Text(
                                  'Are you sure you want to delete the log?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      logProvider.deleteLog(log.id);
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Delete log'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    },
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
