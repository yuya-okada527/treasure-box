import 'package:spike/models/disk_model.dart';
import 'package:sqflite/sqflite.dart';

class DiskRepository {
  static Future<List<DiskModel>> selectAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query("disks");
    return List.generate(maps.length, (index) {
      return DiskModel.fromMap(maps[index]);
    });
  }

  static Future<int> insert(Database db, DiskModel disk) async {
    return await db.insert("disks", disk.toMap());
  }
}
