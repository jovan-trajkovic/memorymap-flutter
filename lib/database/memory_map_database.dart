import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:memory_map/objects/log_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:memory_map/objects/location_log.dart';

part 'memory_map_database.g.dart';

/*Database generating. Code can be reusable, the part line above is the
* name where the generated code goes. The code is generated using
* 'dart run build_runner build', and should be run every time the database
* schema is changed (including changing tables, etc.)*/


LazyDatabase _openConnection(){
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'memory_map.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [LocationLog, LogImage])
class MemoryMapDatabase extends _$MemoryMapDatabase {
  MemoryMapDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  //gets the whole list, todo: check: might need to use a manager later
  Future<List<LocationLogData>> getAllLogs() async {
    return await select(locationLog).get();
  }

  Future<int> insertLog(LocationLogCompanion log) async {
    return await into(locationLog).insert(log);
  }

  Future<int> deleteLog(int id) async {
    return await (delete(locationLog)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<LogImageData>> getImagesForLog(int logId) async {
    return await (select(logImage)..where((tbl) => tbl.logId.equals(logId))).get();
  }

  Future<int> insertImage(LogImageCompanion image) async {
    return await into(logImage).insert(image);
  }

  Future<void> insertImages(List<LogImageCompanion> images) async {
    await batch((batch) {
      batch.insertAll(logImage, images);
    });
  }
}

/*Putting .. is Dart's cascade notation, when a method does not return the
* original object, we can use .. to call another method on that object,
* without retyping the name. Methods can still be chained even though they
* don’t return the current object.*/