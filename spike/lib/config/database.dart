import 'package:spike/config/settings.dart';
import 'package:spike/models/disk_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:async';
import 'package:path/path.dart';

void _onCreate(Database db) {
  for (var ddl in [DiskModel.ddl]) {
    db.execute(ddl);
  }
}

Future<void> _deleteTables(Database db) async {
  for (var resetDdl in [DiskModel.resetDdl]) {
    db.execute(resetDdl);
  }
}

Future<Database> getDatabase() async {
  switch (Settings.env) {
    case "local":
      return openDatabase(
        join(await getDatabasesPath(), "database.db"),
        onCreate: (db, version) {
          _onCreate(db);
        },
        onOpen: (db) async {
          await _deleteTables(db);
          _onCreate(db);
        },
        version: 1,
      );
    case "test":
      sqfliteFfiInit();
      var databaseFactory = databaseFactoryFfi;
      var options = OpenDatabaseOptions(
        onOpen: (db) async {
          await _deleteTables(db);
          _onCreate(db);
        },
        version: 1,
        singleInstance: false,
      );
      return databaseFactory.openDatabase(
        join(await databaseFactory.getDatabasesPath(), "database.db"),
        options: options,
      );
    default:
      return openDatabase(
        join(await getDatabasesPath(), "database.db"),
        onCreate: (db, version) {
          _onCreate(db);
        },
        version: 1,
      );
  }
}
