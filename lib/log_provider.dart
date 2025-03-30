
import 'dart:io';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_map/database/memory_map_database.dart';
import 'package:path_provider/path_provider.dart';

class LogProvider extends ChangeNotifier{
  final MemoryMapDatabase database;
  List<LocationLogData> _logs = [];

  LogProvider({required this.database}) {Future.microtask(() => loadLogs());}

  List<LocationLogData> get logs => _logs;

  Future<void> loadLogs() async {
    print("Loading logs from database...");
    _logs = await database.getAllLogs();
    print("Logs fetched: ${_logs.length}");
    notifyListeners();
  }

  Future<void> addLog(LocationLogCompanion log, List<XFile> images) async {
    List<File> copiedImages = [];// Copied images will go in this list.
    if(images.isNotEmpty) {
      print('Before copying $images');
      copiedImages = await _copyImagesToAppFiles(images);
      print('3. ' + images.toString());
    }
    final logWithThumbnail = log.copyWith(// If the images were copied, the log gets the thumbnail path.
      thumbnailPath: copiedImages.isNotEmpty ? drift.Value(copiedImages.first.path) : const drift.Value.absent(),
    );

    final logId = await database.insertLog(logWithThumbnail);

    if(copiedImages.isNotEmpty) {// Insert the images into the database if they were copied.
      for(var image in copiedImages) {
        await database.insertImage(LogImageCompanion(path: drift.Value(image.path), logId: drift.Value(logId)));
      }
    }
    await loadLogs();
  }

  Future<void> deleteLog(int id) async {
    await database.deleteLog(id);
    await loadLogs();
  }

  Future<List<File>> _copyImagesToAppFiles(List<XFile> images) async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory);
    List<File> copiedFiles = [];

    for (var image in images) {
      print('Copying image: ${image.path}'); // Debugging
      final newImagePath = '${directory.path}\\${DateTime.now().millisecondsSinceEpoch}.jpg';
      final newImage = await File(image.path).copy(newImagePath);
      copiedFiles.add(newImage);
    }

    //print('2. ' + images.toString());

    return copiedFiles;
  }
}