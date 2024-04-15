import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/data_tile.dart';

void main() {
  runApp(const TechnicianProfile());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Technician Profile",
      home: TechnicianProfile(),
    );
  }
}

class TechnicianProfile extends StatefulWidget {
  const TechnicianProfile({super.key});

  @override
  State<TechnicianProfile> createState() => _TechnicianProfileState();
}

class _TechnicianProfileState extends State<TechnicianProfile> {
  var userData = {
    'full_name': "Betsegaw Mesele",
    'Skills': "Mechanical",
    'Phone': "0969481663",
    'Experience': "2 years",
    'educational_level': "bachelor",
    'available_location': "Addis Ababa",
    'additional_bio': "sldkjsldkf dlfskdjfs",
    'Email': "betse@gmail.com"
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: const Text(
            "Technician Profile",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
        const Row(
          children: [
            Column(
              children: [
                Icon(Icons.person),
                Row(
                  children: [
                    DataTile(title: "Full Name", detail: "Betsegaw Mesele"),
                    DataTile(title: "skill", detail: "Mechanical")
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
