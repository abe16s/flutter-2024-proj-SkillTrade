import 'package:flutter/material.dart';
import 'package:skill_trade/models/technician.dart';
import 'package:skill_trade/presentation/widgets/info_label.dart';

class TechnicianSmallProfile extends StatelessWidget {
  final Technician technician;
  const TechnicianSmallProfile({super.key, required this.technician});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/technician.png",
          width: 125,
          height: 125,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          technician.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoLabel(label: "Email", data: technician.email),//"mysteryabe456@gmail.com"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Phone", data: technician.phone),//"0936120470"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Skills", data: technician.skills),//"Electrican, Dish technician"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(
                  label: "Experience",
                  data: technician.experience),//"15 years in ELPA, 3 amet did mastat"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(
                  label: "Education Level",
                  data: technician.education_level),//"Bsc. in Electrical Engineering"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Available Location", data: technician.available_location),//"Harar"),
               SizedBox(
                height: 3,
              ),
              InfoLabel(label: "Additional Bio", data: technician.additional_bio),//"Tiris yeneqelkubet"),
            ],
          ),
        )
      ],
    );
  }
}
