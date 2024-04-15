import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  final String title;
  final String detail;

  const DataTile({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(detail)
      ],
    );
  }
}
