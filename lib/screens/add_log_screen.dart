import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:memory_map/database/memory_map_database.dart';
import 'package:memory_map/log_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AddLogScreen extends StatefulWidget {
  const AddLogScreen({super.key});

  @override
  State<AddLogScreen> createState() => _AddLogScreenState();
}

class _AddLogScreenState extends State<AddLogScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int _rating = 5;
  LatLng? _userLocation;
  LatLng _logLocation = LatLng(
    10,
    10,
  ); //for now it has a placeholder value, till i figure everything out

  void buttonPressed() {
    final logProvider = Provider.of<LogProvider>(context, listen: false);

    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _logLocation != null) {
      //todo: fix the user and log locations - log should not have a hardcoded value and should reset on button add
      var log = LocationLogCompanion(
        logName: drift.Value(_titleController.text),
        description: drift.Value(_descriptionController.text),
        rating: drift.Value(_rating),
        latitude: drift.Value(_logLocation.latitude),
        longitude: drift.Value(_logLocation.longitude),
        addDate: drift.Value(DateTime.now()),
      );

      _titleController.clear();
      _descriptionController.clear();
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

  Future<void> _getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.medium),
    );

    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
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
            SizedBox(
              width: double.infinity,
              height: 400,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: _userLocation ?? LatLng(0, 0),
                  initialZoom: 10,
                  onTap: (tapPosition, point) {
                    setState(() {
                      _logLocation = point;
                    });
                  },
                  minZoom: 3,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: _logLocation,
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
