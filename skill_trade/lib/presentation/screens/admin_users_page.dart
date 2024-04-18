import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skill_trade/presentation/widgets/technician_apply.dart';
import 'package:skill_trade/presentation/widgets/customer_tile.dart';


void main() {
  runApp(const MaterialApp(
    home: AdminPage(),
  ));
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              "Technicians", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            for (int i = 0; i < 5; i++) 
              TechnicianTile(),
            SizedBox(height: 30,),

            Text(
              "Customers", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            for (int i = 0; i < 5; i++) 
              CustomerTile()
          ],


        ),
      )
    );
  }
}