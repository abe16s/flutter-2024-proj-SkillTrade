import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_trade/presentation/widgets/technician_tile.dart';

void main() {
  runApp(const MaterialApp(
    home: AdminPage(),
  ));
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          const Text(
            "Technician Applications",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (int i = 0; i < 5; i++) const TechnicianTile(),
        ],
      ),
    );
  }
}
