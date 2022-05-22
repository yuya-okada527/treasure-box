import 'package:flutter/material.dart';
import 'package:spike/models/disk_model.dart';

class DiskListItem extends StatelessWidget {
  final DiskModel disk;
  const DiskListItem({
    Key? key,
    required this.disk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("images/murmur.jpg"),
          Text(disk.title ?? "Murmur")
        ],
      ),
    );
  }
}
