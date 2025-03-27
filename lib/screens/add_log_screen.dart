import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:memory_map/database/memory_map_database.dart';
import 'package:memory_map/log_provider.dart';
import 'package:provider/provider.dart';

class AddLogScreen extends StatefulWidget {
  const AddLogScreen({super.key});

  @override
  State<AddLogScreen> createState() => _AddLogScreenState();
}

class _AddLogScreenState extends State<AddLogScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  int _rating = 5;

  void buttonPressed() {
    final logProvider = Provider.of<LogProvider>(context, listen: false);

    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _latitudeController.text.isNotEmpty &&
        _longitudeController.text.isNotEmpty) {
      //no need to check if coords are proper numbers, since they will be added from a map
      //todo: gonna add a map to select the location
      var log = LocationLogCompanion(
        logName: drift.Value(_titleController.text),
        description: drift.Value(_descriptionController.text),
        rating: drift.Value(_rating),
        latitude: drift.Value(double.tryParse(_latitudeController.text) ?? 0.0),
        longitude: drift.Value(
          double.tryParse(_longitudeController.text) ?? 0.0,
        ),
        addDate: drift.Value(DateTime.now()),
      );

      _titleController.clear();
      _descriptionController.clear();
      _latitudeController.clear();
      _longitudeController.clear();
      setState(() {
        _rating = 5;
      });
      logProvider.addLog(log);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("You need to enter all fields"),
          duration: Duration(milliseconds: 1500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              minLines: 1,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text('Rating: ${_rating.toStringAsFixed(1)}'),
            Slider(
              value: _rating.toDouble(),
              min: 0,
              max: 10,
              divisions: 10,
              label: _rating.toStringAsFixed(1),
              onChanged: (value) {
                setState(() {
                  _rating = value.toInt();
                });
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _latitudeController,
              decoration: const InputDecoration(labelText: 'Latitude'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _longitudeController,
              decoration: const InputDecoration(labelText: 'Longitude'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => buttonPressed(),
                child: Text(
                  'Save Log',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
