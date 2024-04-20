import 'package:flutter/material.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';
import 'package:skill_trade/presentation/widgets/profile_button.dart';
import 'package:skill_trade/presentation/widgets/technician_profile.dart';

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
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 16),
          // Center(
          //   child: Image.asset(
          //     "assets/technician.png",
          //     width: 125,
          //     height: 125,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // InfoLabel(label: "Full Name", data: "Betsegaw Mesele"),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Skills", data: "Mechanical"),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Phone", data: "0979996940"),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Experience", data: "2Years"),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Educational Lvel", data: "Bachelor"),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Available Loction", data: "Addis Ababa"),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Additional Bio", data: 'additional_bio'),
          // SizedBox(height: 3,),
          // InfoLabel(label: "Email", data: "betse@gmail.com"),
          // const SizedBox(height: 16),
          TechnicianSmallProfile(),
          Center(child: ProfileButton()),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
