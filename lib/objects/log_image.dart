import 'package:drift/drift.dart';
import 'package:memory_map/objects/location_log.dart';

class LogImage extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get path => text()();
  IntColumn get logId => integer().references(LocationLog, #id, onDelete: KeyAction.cascade)();
}