import 'package:drift/drift.dart';


class LocationLog extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get logName => text()();
  TextColumn get description => text()();
  IntColumn get rating => integer()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get thumbnailPath => text().clientDefault(() => '')();
  DateTimeColumn get addDate => dateTime()();
}
