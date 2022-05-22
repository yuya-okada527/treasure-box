import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spike/config/database.dart';
import 'package:spike/models/disk_model.dart';
import 'package:spike/repositories/disk_repository.dart';
import 'package:spike/widgets/disk_list_item.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spike for treasure-box-app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Spike for Treasure Box App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DiskModel> _disks = [];

  @override
  void initState() {
    super.initState();
    Future(() async {
      await _reload();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _disks.length,
          itemBuilder: (context, index) {
            return DiskListItem(disk: _disks[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var db = await getDatabase();
          await DiskRepository.insert(
            db,
            DiskModel(title: "title")
          );
          await _reload();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _reload() async {
    var db = await getDatabase();
    List<DiskModel> disks = await DiskRepository.selectAll(db);
    setState(() {
      _disks = disks;
    });
  }
}
