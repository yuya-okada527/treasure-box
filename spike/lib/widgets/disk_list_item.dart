import 'package:flutter/material.dart';
import 'package:spike/models/disk_model.dart';

const _borderRadius = 8.0;

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
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(_borderRadius),
            child: Image.asset("images/murmur.jpg", fit: BoxFit.fill),
          ),
          Text(disk.title ?? "Murmur")
        ],
      ),
    );
  }
}
