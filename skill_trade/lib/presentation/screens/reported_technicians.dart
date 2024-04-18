import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/customer_tile.dart';
import 'package:skill_trade/presentation/widgets/technician_apply.dart';

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
          const SizedBox(
            height: 30,
          ),
          Text(
            "Reported Users",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red[400]),
          ),
          for (int i = 0; i < 5; i++)
            i % 2 == 0 ? const TechnicianTile() : const CustomerTile()
        ],
      ),
    );
  }
}
