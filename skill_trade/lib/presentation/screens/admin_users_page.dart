import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_trade/presentation/widgets/customer_tile.dart';

void main() {
  runApp(const MaterialApp(
    home: CustomersList(),
  ));
}

class CustomersList extends StatelessWidget {
  const CustomersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          const Text(
            "Customers",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          for (int i = 0; i < 5; i++) const CustomerTile()
        ],
      ),
    );
  }
}
