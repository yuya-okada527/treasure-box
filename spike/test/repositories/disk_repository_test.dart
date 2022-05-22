import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spike/config/database.dart';
import 'package:spike/config/settings.dart';
import 'package:spike/models/disk_model.dart';
import 'package:spike/repositories/disk_repository.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.test");
  group("DiskRepository", () {
    test("insert and selectAll", () async {
      var db = await getDatabase();
      var disk = DiskModel(title: "test");
      await DiskRepository.insert(db, disk);
      var disks = await DiskRepository.selectAll(db);
      expect(disks.length, 1);
      expect(disks.first.title, disk.title);
    });
  });
}
