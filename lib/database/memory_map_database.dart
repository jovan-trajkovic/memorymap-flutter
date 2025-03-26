
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
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

@DriftDatabase(tables: [LocationLog])
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
}