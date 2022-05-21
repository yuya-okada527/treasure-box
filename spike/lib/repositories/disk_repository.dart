import 'package:spike/database.dart';
import 'package:spike/models/disk_model.dart';

class DiskRepository {
  static Future<List<DiskModel>> selectAll() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query("disks");
    return List.generate(maps.length, (index) {
      return DiskModel(id: maps[index]["id"], title: maps[index]["title"]);
    });
  }

  static Future<int> insert(DiskModel disk) async {
    final db = await getDatabase();
    return await db.insert("disks", disk.toMap());
  }
}
