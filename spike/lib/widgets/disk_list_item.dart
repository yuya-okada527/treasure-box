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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset("images/murmur.jpg", fit: BoxFit.fill),
          ),
          // Image.asset("images/murmur.jpg", fit: BoxFit.fill),
          Text(disk.title ?? "Murmur")
        ],
      ),
    );
  }
}
