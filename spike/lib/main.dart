import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spike/models/disk_model.dart';
import 'package:spike/repositories/disk_repository.dart';

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
            return Text(_disks[index].title ?? "no title");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await DiskRepository.insert(
            DiskModel(title: "title")
          );
          await _reload();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _reload() async {
    List<DiskModel> disks = await DiskRepository.selectAll();
    setState(() {
      _disks = disks;
    });
  }
}
