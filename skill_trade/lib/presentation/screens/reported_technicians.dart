import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/customer_tile.dart';
import 'package:skill_trade/presentation/widgets/technician_tile.dart';

void main() {
  runApp(const MaterialApp(
    home: ReportedTechnicians(),
  ));
}

class ReportedTechnicians extends StatelessWidget {
  const ReportedTechnicians({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Text(
            "Reported Users",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
          ),
          for (int i = 0; i < 5; i++)
            i % 2 == 0 ? const TechnicianTile() : const CustomerTile()
        ],
      ),
    );
  }
}
