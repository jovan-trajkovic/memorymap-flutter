
import 'package:flutter/material.dart';
import 'package:memory_map/database/memory_map_database.dart';

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

  Future<void> addLog(LocationLogCompanion log) async {
    await database.insertLog(log);
    await loadLogs();
  }

  Future<void> deleteLog(int id) async {
    await database.deleteLog(id);
    await loadLogs();
  }
}