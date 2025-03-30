import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:memory_map/database/memory_map_database.dart';
import 'package:memory_map/log_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:image_picker/image_picker.dart';

/*Flutter map is used only to be able to show it on the desktop app.
* Might add google maps on android.*/

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
  LatLng? _logLocation;
  List<XFile> _images = [];

  void _buttonPressed() {
    final logProvider = Provider.of<LogProvider>(context, listen: false);

    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _logLocation != null) {
      var log = LocationLogCompanion(
        logName: drift.Value(_titleController.text),
        description: drift.Value(_descriptionController.text),
        rating: drift.Value(_rating),
        latitude: drift.Value(_logLocation!.latitude),
        longitude: drift.Value(_logLocation!.longitude),
        addDate: drift.Value(DateTime.now()),
      );

      _titleController.clear();
      _descriptionController.clear();
      logProvider.addLog(log, List<XFile>.from(_images));

      setState(() {
        _logLocation = null;
        _rating = 5;
        _images.clear();
      });
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

  Future<void> _pickImages() async {
    final ImagePicker imagePicker = ImagePicker();
    final List<XFile> list = await imagePicker.pickMultiImage(
      limit: 6,
      imageQuality: 70,
      requestFullMetadata: false,
    );
    setState(() {
      _images = list;
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
                  initialZoom: 5,
                  minZoom: 3,
                  onTap: (tapPosition, point) {
                    setState(() {
                      _logLocation = point;
                    });
                  },
                  onSecondaryTap: (tapPosition, point) {
                    setState(() {
                      _logLocation = null;
                    });
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  if (_logLocation != null)
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _logLocation!,
                          width: 40,
                          height: 40,
                          child: Transform.translate(
                            offset: const Offset(
                              0,
                              -15,
                            ), // I had to offset it a little, so the marker is on the tap point
                            child: const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            if (_images.isNotEmpty)
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          8,
                        ), // Rounded corners
                        child: Image.file(
                          File(_images[index].path),
                          width: 80, // Thumbnail size
                          height: 80,
                          fit: BoxFit.cover, // Crop to fill box
                        ),
                      ),
                    );
                  },
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
                onPressed: () => _pickImages(),
                child: Text(
                  'Add images',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
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
                onPressed: () => _buttonPressed(),
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
