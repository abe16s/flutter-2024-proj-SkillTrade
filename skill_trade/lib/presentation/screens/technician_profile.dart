import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/booked_card.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';
import 'package:skill_trade/presentation/widgets/profile_button.dart';

void main() {
  runApp(const MyApp());
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
  final Map<String, String> userData = {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Technician Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Image.asset(
              "assets/technician.png",
              width: 125,
              height: 125,
            ),
            const SizedBox(height: 16),
            InfoLabel(label: "Full Name", data: "Betsegaw Mesele"),
            InfoLabel(label: "Skills", data: "Mechanical"),
            InfoLabel(label: "Phone", data: "0979996940"),
            InfoLabel(label: "Experience", data: "2Years"),
            InfoLabel(label: "Educational Lvel", data: "Bachelor"),
            InfoLabel(label: "Available Loction", data: "Addis Ababa"),
            InfoLabel(label: "Additional Bi", data: 'additional_bio'),
            InfoLabel(label: "Email", data: "betse@gmail.com"),
            const SizedBox(height: 16),
            const ProfileButton(),
            const SizedBox(height: 16),
            const Text(
              "Booked To You...",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const TechnicianBookingScreen()
          ],
        ),
      )),
    );
  }
}
